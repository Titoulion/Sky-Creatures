using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using UnityEngine;
using UnityEngine.UI;

public class NetworkConnectionUnity : NetworkConnection
{
    private const string password = "testing password gahfrihj";
    private const int port = 25005;
    private const string masterGameType = "CriticalHitSkyCreatures";

    [SerializeField] private float requestHostListDelay = 1f;

    private new NetworkView networkView;
    private Nest nest;

    private void Start()
    {
        AddDebugLine("Awake");
        if (IsNest)
        {
            StartClient();
        }
        else
        {
            StartServer();
        }
    }

    private void StartServer()
    {
        Network.incomingPassword = password;
        var useNat = true;// !Network.HavePublicAddress();
        var error = Network.InitializeServer(1, port, useNat);
        if (error == NetworkConnectionError.NoError)
        {
            AddDebugLine("Connected! Listening.");
        }
        else
        {
            AddDebugLine("Could not connect to server: " + error);
        }

        networkView = GetComponent<NetworkView>();
    }

    private void OnDestroy()
    {
        if (Network.isServer)
        {
            MasterServer.UnregisterHost();
        }
    }

    private void OnServerInitialized()
    {
        if (Network.isServer)
        {
            MasterServer.RegisterHost(masterGameType, DateTime.Now.Ticks.ToString(), "");
        }
    }

	private void OnPlayerConnected(NetworkPlayer player)
	{
	    AddDebugLine("Connected: " + player.externalIP);
	}

	private void OnPlayerDisconnected(NetworkPlayer player)
	{
	    AddDebugLine("Disconnected: " + player.externalIP);
	}

    private void StartClient()
    {
        AddDebugLine("Trying to start a client! Current status: " + Network.isClient);
        nest = FindObjectOfType<Nest>();
        StartCoroutine(PullList());
    }

    private IEnumerator PullList()
    {
        AddDebugLine("List pulling triggered! Current status: " + Network.isClient);
        while (!Network.isClient)
        {
            AddDebugLine("Trying to find a server...");
            MasterServer.RequestHostList(masterGameType);
            yield return new WaitForSeconds(requestHostListDelay);

            var hostList = MasterServer.PollHostList();
            if (hostList.Length > 0)
            {
                var bestChoiceHost = hostList.Where(host => (host.connectedPlayers == 1)).OrderByDescending(host => long.Parse(host.gameName)).FirstOrDefault();
                if (bestChoiceHost != null)
                {
                    AddDebugLine("Connecting!");
                    var error = Network.Connect(bestChoiceHost, password);
                    switch (error)
                    {
                        case NetworkConnectionError.NoError:
                            AddDebugLine("No connection error");
                            yield break;

                        default:
                            AddDebugLine("Connection error: " + error);
                            break;
                    }
                }
            }
        }
    }

    private void OnConnectedToServer()
    {
        AddDebugLine("Connected to server");
    }

    private void OnDisconnectedFromServer(NetworkDisconnection info)
    {
        AddDebugLine("Disconnected from server: " + info);
    }

    private void OnFailedToConnect(NetworkConnectionError error)
    {
        AddDebugLine("Could not connect to server: " + error);
    }

    public override void SendResetCreatures()
    {
        networkView.RPC("ResetCreatures", RPCMode.Others);
    }

    public override void SendCreatureCaught(int seed)
    {
        networkView.RPC("CreatureCaught", RPCMode.Others, seed);
    }

    [RPC]
    private void ResetCreatures()
    {
        nest.ResetCreatures();
    }

    [RPC]
    private void CreatureCaught(int seed)
    {
        nest.CreatureCaught(seed);
    }
}
