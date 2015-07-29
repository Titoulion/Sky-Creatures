using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using UnityEngine;

public class Nest : MonoBehaviourBase
{
    [SerializeField] private int creatureCount = 3;

    private List<Creature> creatures;

    private void Awake()
    {
        creatures = new List<Creature>();
    }

    public void ResetCreatures()
    {
        foreach (var creature in creatures)
        {
            Destroy(creature.gameObject);
        }
        creatures.Clear();
    }

    public void CreatureCaught(int seed)
    {
        if (creatures.Count == creatureCount)
        {
            Debug.LogError("All creatures are already caught!");
            return;
        }

        var screenWidth = Camera.main.ScreenToWorldPoint(new Vector3()).x * -2;
        var index = creatures.Count;
        var percentX = (float)(index + 1) / (creatureCount + 1);
        var position = new Vector2(-screenWidth / 2 + percentX * screenWidth, 0);

        var creature = CreatureCreator.Instance.SpawnRandom(seed);
        creature.transform.position = position;
        creatures.Add(creature);
    }
}
