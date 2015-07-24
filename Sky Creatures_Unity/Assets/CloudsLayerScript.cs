using UnityEngine;
using System.Collections;

public class CloudsLayerScript : MonoBehaviour {

	// Use this for initialization

	Material myMat;

	public Vector2 minMaxCloud;
	public AnimationCurve curveVanish;
	float valueFeedbackDistance = 0f;
	float currentValueFeedbackDistance = 0f;

	void Start () {
		myMat = GetComponent<Renderer>().material;
	}
	
	// Update is called once per frame
	void Update () 
	{
		currentValueFeedbackDistance = Mathf.Lerp(currentValueFeedbackDistance,valueFeedbackDistance,0.1f);
		myMat.SetFloat("_FeedbackDistance",currentValueFeedbackDistance);
	}

	public void Vanish(float progress)
	{
		myMat.SetFloat ("_SizeClouds", Mathf.Lerp(minMaxCloud.x,minMaxCloud.y,curveVanish.Evaluate(progress)));
	}

	public void SetHorizontalSpeed(float value)
	{
		Vector2 valueOffset = myMat.GetTextureOffset("_Perlin3");
		valueOffset.x+= value;

		myMat.SetTextureOffset("_Perlin3",valueOffset);

		valueOffset = myMat.GetTextureOffset("_TextureFeedback");
		valueOffset.x+= value;
		
		myMat.SetTextureOffset("_TextureFeedback",valueOffset);

	
	}

	public void SetValueDistort(float value)
	{
		float value2 = myMat.GetFloat("_ValueDistort");
		value2+= value;
		
		myMat.SetFloat("_ValueDistort",value2);
		
		
	}


	public float GetValueX()
	{
		return(Modulo (myMat.GetTextureOffset("_Perlin3").x,1f));
	}

	public float GetValueY()
	{
		return(Modulo (myMat.GetFloat("_ValueDistort"),Mathf.PI*2f)/(2f*Mathf.PI));
	}

	public void SetValueFeedbackDistance(float value)
	{
		valueFeedbackDistance = value;
	}

	float Modulo(float a,float b)
	{
		return a - b * Mathf.Floor(a / b);
	}





}
