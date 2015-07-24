using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using UnityEngine;

public class CreaturePart : MonoBehaviourBase
{
    [SerializeField] private CreaturePartType type;

    public CreaturePartType Type { get { return type; } }

    public void FillSlots()
    {
        var slots = GetComponentsInChildren<CreaturePartSlot>();
        foreach (var slot in slots)
        {
            slot.Fill();
        }
    }
}
