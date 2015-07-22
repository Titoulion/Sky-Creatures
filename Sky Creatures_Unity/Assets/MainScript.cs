using UnityEngine;
using System.Collections;

public class MainScript : MonoBehaviour {

	// Use this for initialization

	public float value1 =0f;
	public float value2 =0f;
	public float value3 =0f;
	public float value4 =0f;
	public float value5 =0f;
	public float value6 =0f;
	public float value7 =0f;
	public float value8 =0f;

	public CloudsLayerScript[] listLayers;



	public int frontIndex = 0;
	bool reorganising = false;
	float progressVanish = 0f;
	bool vanishing = false;
	int indexToVanish = 0;
	public float durationVanish = 0.3f;


	void Start () 
	{
		PlaceLayers(frontIndex);
	}
	
	// Update is called once per frame
	void Update () 
	{
		KeyboardInputs();

		Reorganizing();

	}

	void KeyboardInputs()
	{
		if(Input.GetKeyDown(KeyCode.Keypad0))
		{
			PlaceLayers(0);
		}

		if(Input.GetKeyDown(KeyCode.Keypad1))
		{
			PlaceLayers(1);
		}

		if(Input.GetKeyDown(KeyCode.Keypad2))
		{
			PlaceLayers(2);
		}

		if(Input.GetKeyDown(KeyCode.Keypad3))
		{
			PlaceLayers(3);
		}

		if(Input.GetKeyDown(KeyCode.UpArrow))
		{
			LaunchReorganisation(true);
		}

		if(Input.GetKeyDown(KeyCode.DownArrow))
		{
			LaunchReorganisation(false);
		}

	}

	void LaunchReorganisation(bool moveForward)
	{
		if(reorganising == false)
		{





			if(moveForward)
			{
				frontIndex = (int)Modulo ((float)(frontIndex-1),(float)listLayers.Length);
				indexToVanish = frontIndex;
			}
			else
			{
				frontIndex = (int)Modulo ((float)(frontIndex+1),(float)listLayers.Length);

				indexToVanish = (int)Modulo ((float)(frontIndex+3),(float)listLayers.Length);
			}

			reorganising = true;
			vanishing=true;


		}
	}

	void Reorganizing()
	{
		if(reorganising)
		{
			if(vanishing)
			{
				progressVanish=Mathf.Clamp01(progressVanish+Time.deltaTime/durationVanish);

				listLayers[indexToVanish].Vanish(progressVanish);


				if(progressVanish==1f)
				{
					PlaceLayers(frontIndex);
					vanishing = false;
				}

			}
			else
			{
				progressVanish=Mathf.Clamp01(progressVanish-Time.deltaTime/durationVanish);

				listLayers[indexToVanish].Vanish(progressVanish);
				if(progressVanish==0f)
				{
					reorganising = false;
				}
			}

		}
	}



	void PlaceLayers(int _frontIndex)
	{
		for(int i = 0; i<listLayers.Length;i++)
		{
			int _i = (int)Modulo((float)(_frontIndex+i),(float)listLayers.Length);

			listLayers[_i].gameObject.transform.position = Vector3.forward*(float)i;
		}
	}

	void Reorganize()
	{

	}

	float Map(float val, float fromMin, float fromMax, float toMin, float toMax) {
		return ((val - fromMin) / (fromMax - fromMin)) * (toMax - toMin) + toMin;
	}

	float Modulo(float a,float b)
	{
		return a - b * Mathf.Floor(a / b);
	}

	public void Slider1(float value){	value1 = value;	}
	public void Slider2(float value){	value2 = value;	}
	public void Slider3(float value){	value3= value;	}
	public void Slider4(float value){	value4 = value;	}
	public void Slider5(float value){	value5 = value;	}
	public void Slider6(float value){	value6 = value;	}
	public void Slider7(float value){	value7 = value;	}
	public void Slider8(float value){	value8 = value;	}

}
