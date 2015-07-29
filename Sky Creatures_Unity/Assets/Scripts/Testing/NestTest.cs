using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using UnityEngine;

public class NestTest : MonoBehaviourBase
{
    private Nest nest;

    private void Awake()
    {
        nest = FindObjectOfType<Nest>();
    }

    private void Update()
    {
        for (var i = 1; i <= 9; i++)
        {
            if (Input.GetKeyDown(i.ToString()))
            {
                nest.CreatureCaught(i);
            }
        }

        if (Input.GetKeyDown(KeyCode.A))
        {
            nest.CreatureCaught(UnityEngine.Random.Range(int.MinValue, int.MaxValue));
        }

        if (Input.GetKeyDown(KeyCode.Space))
        {
            nest.ResetCreatures();
        }
    }
}
