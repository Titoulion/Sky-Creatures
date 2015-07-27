using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using UnityEngine;

public class CreaturePartSlot : MonoBehaviourBase
{
    [SerializeField] private CreaturePartType type;

    public void Fill(Creature creature)
    {
        var partPrefab = creature.GetPartPrefab(type);
        var part = InstantiatePrefab(partPrefab, transform.position, transform.rotation);
        part.transform.parent = transform;
        
        part.FillSlots(creature);
    }
}
