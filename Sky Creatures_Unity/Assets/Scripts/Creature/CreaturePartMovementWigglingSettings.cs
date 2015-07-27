using System;
using UnityEngine;

public class CreaturePartMovementWigglingSettings : MonoBehaviourBase
{
    [Serializable]
    public class Element
    {
        public AnimationCurve movementCurve;
        public BetweenFloat movementStrength;
        public BetweenFloat movementTime;
    }

    public Element[] elements;
    public BetweenFloat waitingTimeBetween;
}
