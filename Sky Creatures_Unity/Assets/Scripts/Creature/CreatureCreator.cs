using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using UnityEngine;

public class CreatureCreator : SingletonMonoBehaviour<CreatureCreator>
{
    [SerializeField] private CreaturePart[] parts;

    private Dictionary<CreaturePartType, List<CreaturePart>> partsByType;
    private List<Creature> creatureBasePrefabs; 

    private void Awake()
    {
        creatureBasePrefabs = new List<Creature>();

        partsByType = new Dictionary<CreaturePartType, List<CreaturePart>>();
        foreach (var part in parts)
        {
            var type = part.Type;
            if (!partsByType.ContainsKey(type))
            {
                partsByType[type] = new List<CreaturePart>();
            }
            partsByType[part.Type].Add(part);

            var creature = part.GetComponent<Creature>();
            if (creature != null)
            {
                creatureBasePrefabs.Add(creature);
            }
        }
    }

    public Creature SpawnRandom()
    {
        var creature = InstantiatePrefab(creatureBasePrefabs.RandomElement());
        creature.Create();
        return creature;
    }

    public CreaturePart GetRandomPartPrefab(CreaturePartType type)
    {
        return partsByType[type].RandomElement();
    }
}
