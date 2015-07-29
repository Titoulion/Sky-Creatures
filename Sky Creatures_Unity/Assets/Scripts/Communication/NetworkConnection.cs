using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using UnityEngine;
using UnityEngine.UI;

public abstract class NetworkConnection : MonoBehaviourBase
{
    [SerializeField] private bool simulateMobile;
    [SerializeField] private bool showDebugText;
    [SerializeField] private Text debugText;
    [SerializeField] private int debugTextLineCount = 14;

    public abstract void SendSpawnCreatures(int[] seeds);
    public abstract void SendCreaturesFlyAway();
    public abstract void SendCreatureCaught(int seed);
    public abstract void SendRemoveCreatures();

    protected bool IsNest { get { return Application.isMobilePlatform || simulateMobile; } }
    protected bool IsGame { get { return !IsNest; } }

    private List<string> debugLines = new List<string>();
    private bool restarting;

    protected void AddDebugLine(string str)
    {
        Debug.Log(str);

        if (!showDebugText || (debugText == null)) // !Debug.isDebugBuild
            return;

        debugLines.Add("[" + DateTime.Now.ToLongTimeString() + "] " + str);
        if (debugLines.Count > debugTextLineCount)
        {
            debugLines.RemoveAt(0);
        }

        debugText.text = debugLines.ToOneLineString("\n", "");
    }

    protected virtual void Update()
    {
        if ((Application.isMobilePlatform || simulateMobile) && Input.GetKeyDown(KeyCode.Escape))
        {
            Restart();
        }
    }

    protected void Restart()
    {
        if (restarting)
            return;

        restarting = true;
        Application.LoadLevel(Application.loadedLevel);        
    }
}
