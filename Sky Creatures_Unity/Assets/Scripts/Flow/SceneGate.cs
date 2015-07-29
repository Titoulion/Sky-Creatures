using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using UnityEngine;

public class SceneGate : PersistentSingletonMonoBehaviour<SceneGate>
{
    [SerializeField] private string gameScene;
    [SerializeField] private string nestScene;

    private void Start()
    {
        if (Application.isMobilePlatform)
        {
            Application.LoadLevel(nestScene);
        }
        else
        {
            Application.LoadLevel(gameScene);
        }
    }

    private void Update()
    {
        if (Input.GetKeyDown(KeyCode.N))
        {
            Application.LoadLevel(nestScene);
        }
        else if (Input.GetKeyDown(KeyCode.G))
        {
            Application.LoadLevel(gameScene);
        }
    }
}
