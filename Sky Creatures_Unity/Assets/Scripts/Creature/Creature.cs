using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using UnityEngine;

public class Creature : MonoBehaviourBase
{
    public void Create()
    {
        var baseParts = GetComponentsInChildren<CreaturePart>();
        foreach (var part in baseParts)
        {
            part.FillSlots();
        }
    }
}
