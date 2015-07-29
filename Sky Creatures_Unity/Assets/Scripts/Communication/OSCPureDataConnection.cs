using System;
using System.Collections.Generic;
using System.Net;
using UnityEngine;
using System.Collections;
using UnityOSC;

public class OSCPureDataConnection : SingletonMonoBehaviour<OSCPureDataConnection>
{
    private const string ClientName = "PD-out";
    private const string ClientName2 = "PD-out2";

    [SerializeField] private string clientTargetAddress = "127.0.0.1";
    [SerializeField] private int clientTargetPort = 9001;
    [SerializeField] private int clientTargetPort2 = 9002;

    private void Awake()
    {
        OSCHandler.Instance.CreateClient(ClientName, IPAddress.Parse(clientTargetAddress), clientTargetPort);
        OSCHandler.Instance.CreateClient(ClientName2, IPAddress.Parse(clientTargetAddress), clientTargetPort2);
    }

    public void SendDirections(float up, float down, float left, float right)
    {
        Send("up", up);
        Send("down", down);
        Send("left", left);
        Send("right", right);
    }

    public void SendLayer(int layer)
    {
        Send("layer", layer);
    }

    public void SendCreatureCatch()
    {
        Send("creaturecatch", 1);
    }

    public void SendCreatureProximity(float proximity)
    {
        Send("creatureproximity", proximity);
    }

    public void SendCreatureType(Creature creature)
    {
        /* 0 = giraffe
           1 = goat
           2 = dog
           3 = monkey
           4 = cat
           5 = bird2 */
        Send("creaturetype", creature.PureDataCreatureIndex);
    }

    public void SendEndGame()
    {
        Send("endgame", 1);
    }

    public void Send<T>(string pathEnd, T value)
    {
        OSCHandler.Instance.SendMessageToClient(ClientName, "/toby/" + pathEnd, value);
        OSCHandler.Instance.SendMessageToClient(ClientName2, "/toby/" + pathEnd, value);
    }
}
