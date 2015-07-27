using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using UnityEngine;

public class CreaturePart : MonoBehaviourBase
{
    [SerializeField] private CreaturePartType type;
    [SerializeField] private CreaturePart pairedTo;

    public CreaturePartType Type { get { return type; } }
    public CreaturePart PairedTo { get { return pairedTo; } }

    public void FillSlots(Creature creature)
    {
        var slots = GetComponentsInChildren<CreaturePartSlot>();
        foreach (var slot in slots)
        {
            slot.Fill(creature);
        }
    }
}
