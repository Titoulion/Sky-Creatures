using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using UnityEngine;

public class NestTestNetwork : NestTest
{
    private NetworkConnection networkConnection;

    protected override void Awake()
    {
        base.Awake();

        networkConnection = FindObjectOfType<NetworkConnectionPlayerIO>();
    }

    protected override void CallSpawnCreatures(int[] seeds)
    {
        networkConnection.SendSpawnCreatures(seeds);
    }

    protected override void CallCreaturesFlyAway()
    {
        networkConnection.SendCreaturesFlyAway();
    }

    protected override void CallCreatureCaught(int seed)
    {
        networkConnection.SendCreatureCaught(seed);
    }

    protected override void CallRemoveCreatures()
    {
        networkConnection.SendRemoveCreatures();
    }
}
