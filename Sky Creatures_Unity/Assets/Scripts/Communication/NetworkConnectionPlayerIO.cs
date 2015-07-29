using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using PlayerIOClient;
using UnityEngine;
using UnityEngine.UI;

public class NetworkConnectionPlayerIO : NetworkConnection
{
    private const string TYPE_SPAWN_CREATURES = "A";
    private const string TYPE_CREATURES_FLY_AWAY = "B";
    private const string TYPE_CREATURE_CAUGHT = "C";
    private const string TYPE_REMOVE_CREATURES = "D";

    public bool useDevelopmentServer = true;
    public float pingDelay = 0.5f;

    public string gameId = "";

    public Client Client { get; set; }
    public Connection Connection { get; private set; }

    private Countdown errorRetryCountdown;
    private bool joinedRoom;
    private bool connecting;

    private List<Message> queuedMessages = new List<Message>(); 

    private void Start()
    {
        errorRetryCountdown = new Countdown(5f);

        Connect();
    }

    private void OnDestroy()
    {
        joinedRoom = false;

        if (Connection != null)
        {
            Connection.Disconnect();
            Connection = null;
        }

        if (Client != null)
        {
            try
            {
                Client.Logout();
            }
            catch
            {
            }
            Client = null;
        }
    }

    private void OnSuccessConnecting(Client client)
    {
        connecting = false;

        AddDebugLine("Successfully connected to Player.IO");

        errorRetryCountdown.TimeLeft = 0;

        Client = client;

        JoinRoom();
    }

    private void Connect()
    {
        if (connecting)
            return;

        connecting = true;

        PlayerIO.Connect(
            gameId, // Game id (Get your own at playerio.com. 1: Create user, 2:Goto admin pannel, 3:Create game, 4: Copy game id inside the "")
            "public", // The id of the connection, as given in the settings section of the admin panel. By default, a connection with id='public' is created on all games.
            PlayerId, // The id of the user connecting. This can be any string you like. For instance, it might be "fb10239" if you´re building a Facebook app and the user connecting has id 10239
            null, // If the connection identified by the connection id only accepts authenticated requests, the auth value generated based on UserId is added here
            null,
            null,
            OnSuccessConnecting,
            OnErrorConnecting
            );
    }

    protected string PlayerId
    {
        get { return IsGame ? "Game" : "Nest"; }
    }

    private void JoinRoom()
    {
        if (useDevelopmentServer && (Application.isEditor || (Application.platform == RuntimePlatform.WindowsPlayer)))
            Client.Multiplayer.DevelopmentServer = new ServerEndpoint("localhost", 8184);

        //Create or join the room 
        Client.Multiplayer.CreateJoinRoom(
            "Default", //Room id. If set to null a random roomid is used
            "SkyCreatures", //The room type started on the server
            true, //Should the room be visible in the lobby?
            null,
            null,
            OnJoinedRoom,
            OnErrorJoiningRoom
            );
    }

    private void OnErrorConnecting(PlayerIOError error)
    {
        connecting = false;

        AddDebugLine("Error connecting: " + error);

        errorRetryCountdown.Reset();
    }

    private void OnJoinedRoom(Connection connection)
    {
        errorRetryCountdown.TimeLeft = 0;

        AddDebugLine("Joined Room.");
        // We successfully joined a room so set up the message handler
        Connection = connection;
        Connection.OnMessage += OnPlayerIOMessage;
        Connection.OnDisconnect += OnDisconnect;
        joinedRoom = true;

        foreach (var message in queuedMessages)
        {
			Debug.Log(message.Type);
            Connection.Send(message);
        }
        queuedMessages.Clear();
    }

    private void OnErrorJoiningRoom(PlayerIOError error)
    {
        AddDebugLine("Error Joining Room: " + error);

        errorRetryCountdown.Reset();
    }

    private void OnPlayerIOMessage(object sender, Message m)
    {
        if (!IsNest)
            return;

        var nest = FindObjectOfType<Nest>();

        switch (m.Type)
        {
            case TYPE_SPAWN_CREATURES:
                var seeds = new int[m.GetInt(0)];
                for (var i = 0u; i < seeds.Length; i++)
                {
                    seeds[i] = m.GetInt(i + 1);
                }
                nest.SpawnCreatures(seeds);
                break;

            case TYPE_CREATURES_FLY_AWAY:
                nest.CreaturesFlyAway();
                break;

            case TYPE_CREATURE_CAUGHT:
                nest.CreatureCaught(m.GetInt(0));
                break;

            case TYPE_REMOVE_CREATURES:
                nest.RemoveCreatures(true);
                break;
        }
    }

    private void OnDisconnect(object sender, string message)
    {
        if (IsNest)
        {
            Restart();
        }
    }

    public override void SendSpawnCreatures(int[] seeds)
    {
        var message = Message.Create(TYPE_SPAWN_CREATURES);
        message.Add(seeds.Length);
        foreach (var seed in seeds)
        {
            message.Add(seed);
        }

        SendMessage(message);
    }

    public override void SendCreaturesFlyAway()
    {
        SendMessage(Message.Create(TYPE_CREATURES_FLY_AWAY)); 
    }

    public override void SendCreatureCaught(int seed)
    {
        SendMessage(Message.Create(TYPE_CREATURE_CAUGHT, seed)); 
    }

    public override void SendRemoveCreatures()
    {
        SendMessage(Message.Create(TYPE_REMOVE_CREATURES));   
    }

    private void SendMessage(Message message)
    {
		if (joinedRoom)
        {
            Connection.Send(message);
        }
        else
        {
            queuedMessages.Add(message);
        }
    }

    protected override void Update()
    {
        if (errorRetryCountdown.TimeLeft > 0)
        {
            if (errorRetryCountdown.Update())
            {
                if (Client == null)
                {
                    Connect();
                }
                else
                {
                    JoinRoom();
                }
            }
        }

        base.Update();
    }
}
