using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using UnityEngine;

public class Creature : MonoBehaviourBase
{
    [SerializeField] private int pureDataCreatureIndex;

    private CreatureCreator creatureCreator;
    private Dictionary<CreaturePartType, CreaturePart> queuedCreatureParts;
    public int Seed { get; set; }

    public int PureDataCreatureIndex { get { return pureDataCreatureIndex; } }

    private void Awake()
    {
        creatureCreator = CreatureCreator.Instance;
    }

    public void Create()
    {
        queuedCreatureParts = new Dictionary<CreaturePartType, CreaturePart>();

        var baseParts = GetComponentsInChildren<CreaturePart>();
        foreach (var part in baseParts)
        {
            part.FillSlots(this);
        }

        queuedCreatureParts = null;
    }

    public CreaturePart GetPartPrefab(CreaturePartType type)
    {
        if (queuedCreatureParts.ContainsKey(type))
        {
            var queuedPart = queuedCreatureParts[type];
            queuedCreatureParts.Remove(type);
            return queuedPart;
        }

        var part = creatureCreator.GetRandomPartPrefab(type);
        if (part.PairedTo != null)
        {
            queuedCreatureParts.Add(part.PairedTo.Type, part.PairedTo);
        }

        return part;
    }
}
