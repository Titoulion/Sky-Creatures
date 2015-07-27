using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using UnityEngine;

public class CreaturePartMovementWiggling : MonoBehaviourBase
{
    [SerializeField] private CreaturePartMovementWigglingSettings[] settingsArray;

    private void Start()
    {
        if (settingsArray.Length == 0)
        {
            Destroy(this);
            return;
        }

        StartCoroutine(Move());
    }

    private IEnumerator Move()
    {
        var countdown = new Countdown(0);

        while (true)
        {
            var settings = settingsArray.RandomElement();
            var element = settings.elements.RandomElement();
            
            countdown.Reset(settings.waitingTimeBetween.Random);
            while (!countdown.Update())
                yield return null;

            var strength = element.movementStrength.Random;
            var curve = element.movementCurve;
            countdown.Reset(element.movementTime.Random);

            var direction = MathUtil.RandomSign;

            while (!countdown.Update())
            {
                transform.SetLocalRotationEuler(z: curve.Evaluate(countdown.Percent) * strength * direction);
                yield return null;
            }

            transform.SetLocalRotationEuler(z: 0);
        }
    }
}
