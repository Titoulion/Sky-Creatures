using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using UnityEngine;

public class NestTestNetwork : MonoBehaviourBase
{
    private NetworkConnection networkConnection;

    private void Awake()
    {
        networkConnection = FindObjectOfType<NetworkConnectionPlayerIO>();
        Debug.Log(networkConnection);
    }

    private void Update()
    {
        if (networkConnection == null)
            return;

        for (var i = 1; i <= 9; i++)
        {
            if (Input.GetKeyDown(i.ToString()))
            {
                networkConnection.SendCreatureCaught(i);
            }
        }

        if (Input.GetKeyDown(KeyCode.A))
        {
            networkConnection.SendCreatureCaught(UnityEngine.Random.Range(int.MinValue, int.MaxValue));
        }

        if (Input.GetKeyDown(KeyCode.Space))
        {
            networkConnection.SendResetCreatures();
        }
    }
}
