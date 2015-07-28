using System;
using System.Collections.Generic;
using System.Net;
using UnityEngine;
using System.Collections;
using UnityOSC;

public class OSCPureDataConnection : MonoBehaviour
{
    private const string ClientName = "PD-out";

    [SerializeField] private string clientTargetAddress = "127.0.0.1";
    [SerializeField] private int clientTargetIP = 9001;

    private void Awake()
    {
        OSCHandler.Instance.CreateClient(ClientName, IPAddress.Parse(clientTargetAddress), clientTargetIP);
    }

    private void Update()
    {
        // Type something and it shows up in the PureData console
        if (Input.anyKeyDown)
        {
            OSCHandler.Instance.SendMessageToClient(ClientName, "/just/some/path", Input.inputString);
        }
    }

    public void SendDirections(float up, float down, float left, float right)
    {
        OSCHandler.Instance.SendMessageToClient(ClientName, "/toby/up", up);
        OSCHandler.Instance.SendMessageToClient(ClientName, "/toby/down", down);
        OSCHandler.Instance.SendMessageToClient(ClientName, "/toby/left", left);
        OSCHandler.Instance.SendMessageToClient(ClientName, "/toby/right", right);
    }

    public void SendLayer(int layer)
    {
        OSCHandler.Instance.SendMessageToClient(ClientName, "/toby/layer", layer);
    }

    public void SendCreatureCatch()
    {
        OSCHandler.Instance.SendMessageToClient(ClientName, "/toby/creaturecatch", 1);
    }

    public void SendCreatureProximity(float proximity)
    {
        OSCHandler.Instance.SendMessageToClient(ClientName, "/toby/creatureproximity", proximity);
    }
}
