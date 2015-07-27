using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using UnityEngine;

public class CreatureMovement : MonoBehaviourBase
{
    private CreatureMovementSettings settings;
    private Dictionary<CreaturePartType, CreaturePart> parts;

    private void Awake()
    {
        settings = CreatureMovementSettings.Instance;

        parts = new Dictionary<CreaturePartType, CreaturePart>();
        foreach (var part in GetComponentsInChildren<CreaturePart>())
        {
            parts[part.Type] = part;
        }
    }
}
