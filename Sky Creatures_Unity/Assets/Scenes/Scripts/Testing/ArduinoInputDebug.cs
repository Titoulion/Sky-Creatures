using UnityEngine;
using System.Collections;
using UnityEngine.UI;

public class ArduinoInputDebug : MonoBehaviour
{
    [SerializeField] private Slider[] sliders;
    [SerializeField] private TextMesh debugText;
    [SerializeField] private Color colorTouched = Color.red;

    private ArduinoInput arduinoInput;
    private Color colorUntouched;

    private void Awake()
    {
        arduinoInput = ArduinoInput.Instance;

        colorUntouched = sliders[0].fillRect.GetComponent<Image>().color;

        if (debugText != null)
        {
            debugText.text = "";
            debugText.gameObject.SetActive(true);
        }
    }

    private void Update()
    {
        if (arduinoInput.IsDebugTextUpdated && (debugText != null))
        {
            debugText.text = arduinoInput.GetDebugTextUpdate();
        }

        for (var i = 0; i < sliders.Length; i++)
        {
            sliders[i].value = arduinoInput.GetClosenessDistance(i);
            sliders[i].fillRect.GetComponent<Image>().color = arduinoInput.GetTouch(i) ? colorTouched : colorUntouched;
        }
    }
}
