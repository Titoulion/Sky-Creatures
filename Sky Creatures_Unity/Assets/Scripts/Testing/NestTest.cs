using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using UnityEngine;

public class NestTest : MonoBehaviourBase
{
    private Nest nest;

    private int[] seeds;
    private int nextCatchIndex;

    protected virtual void Awake()
    {
        nest = FindObjectOfType<Nest>();
    }

    private void Update()
    {
        for (var i = 1; i <= 9; i++)
        {
            if (Input.GetKeyDown(i.ToString()))
            {
                SpawnCreatures(i);
            }
        }

        if (Input.GetKeyDown(KeyCode.V))
        {
            SpawnCreatures(3);
        }

        if (Input.GetKeyDown(KeyCode.B))
        {
            CallCreaturesFlyAway();
        }

        if (Input.GetKeyDown(KeyCode.N))
        {
            CatchCreature();
        }

        if (Input.GetKeyDown(KeyCode.M))
        {
            CallRemoveCreatures();
        }
    }

    private void SpawnCreatures(int count)
    {
        seeds = new int[count];
        for (var i = 0; i < count; i++)
        {
            seeds[i] = UnityEngine.Random.Range(int.MinValue, int.MaxValue);
        }
        nextCatchIndex = 0;

        CallSpawnCreatures(seeds);
    }

    private void CatchCreature()
    {
        if (nextCatchIndex >= seeds.Length)
            return;

        CallCreatureCaught(seeds[nextCatchIndex]);
        nextCatchIndex++;
    }

    protected virtual void CallSpawnCreatures(int[] seeds)
    {
        nest.SpawnCreatures(seeds);
    }

    protected virtual void CallCreaturesFlyAway()
    {
        nest.CreaturesFlyAway();
    }

    protected virtual void CallCreatureCaught(int seed)
    {
        nest.CreatureCaught(seed);
    }

    protected virtual void CallRemoveCreatures()
    {
        nest.RemoveCreatures(true);
    }
}
