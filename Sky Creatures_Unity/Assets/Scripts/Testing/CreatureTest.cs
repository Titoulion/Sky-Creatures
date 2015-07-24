using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using UnityEngine;

public class CreatureTest : MonoBehaviourBase
{
    private void Awake()
    {
        CreatureCreator.Instance.SpawnRandom();
    }

    private void Update()
    {
        if (Input.GetMouseButtonDown(0))
        {
            Application.LoadLevel(Application.loadedLevel);
        }
    }
}
