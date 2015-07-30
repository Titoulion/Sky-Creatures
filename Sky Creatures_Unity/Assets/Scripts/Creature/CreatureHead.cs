using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using UnityEngine;

public class CreatureHead : MonoBehaviourBase
{
    [SerializeField] private CreatureHeadType type;

    public CreatureHeadType Type { get { return type; } }
}
