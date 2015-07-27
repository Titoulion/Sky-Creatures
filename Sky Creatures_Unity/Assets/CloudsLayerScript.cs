using UnityEngine;
using System.Collections;

public class CloudsLayerScript : MonoBehaviour {

	// Use this for initialization

	Material myMat;

	public Vector2 minMaxCloud;
	public AnimationCurve curveVanish;
	float valueFeedbackDistance = 0f;
	float currentValueFeedbackDistance = 0f;

	public CreatureScript myCreature;

	public int indexLayer;



	public void SetMyCreature(CreatureScript creat)
	{
		myCreature = creat;
		myCreature.SetRandomPosition(indexLayer);
		myCreature.gameObject.transform.parent = transform;
		myCreature.gameObject.transform.localPosition = new Vector3(0f,2f,-1.83f);
		myCreature.gameObject.transform.localScale = new Vector3(0.6f,0.6f,0.6f);


		myCreature.myMatBase.SetTexture("_Perlin3",myMat.GetTexture("_Perlin3"));
		myCreature.myMatBase.SetTexture("_Perlin4",myMat.GetTexture("_Perlin4"));

		myCreature.myMatBase.SetTextureOffset("_Perlin3",myMat.GetTextureOffset("_Perlin3"));
		myCreature.myMatBase.SetTextureOffset("_Perlin4",myMat.GetTextureOffset("_Perlin4"));
		myCreature.myMatBase.SetTextureScale("_Perlin3",new Vector2(-myMat.GetTextureScale("_Perlin3").x,myMat.GetTextureScale("_Perlin3").y));
		myCreature.myMatBase.SetTextureScale("_Perlin4",new Vector2(-myMat.GetTextureScale("_Perlin4").x,myMat.GetTextureScale("_Perlin4").y));


		myCreature.myMatBase.SetFloat("_SizeClouds",myMat.GetFloat("_SizeClouds"));
		myCreature.myMatBase.SetColor("_ColorOutline",myMat.GetColor("_ColorOutline"));
		myCreature.myMatBase.SetFloat("_GlobalDistoForce",myMat.GetFloat("_GlobalDistoForce"));
		//myCreature.myMatBase.SetFloat("_SizeClouds",myMat.GetFloat("_SizeClouds"));
	}


	void Awake () {
		myMat = GetComponent<Renderer>().material;
	}
	
	// Update is called once per frame
	void Update () 
	{
		currentValueFeedbackDistance = Mathf.Lerp(currentValueFeedbackDistance,valueFeedbackDistance,0.1f);
		myMat.SetFloat("_FeedbackDistance",currentValueFeedbackDistance);
		myCreature.myMatBase.SetFloat("_FeedbackDistance",currentValueFeedbackDistance);
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
		myCreature.myMatBase.SetTextureOffset("_Perlin3",valueOffset);



		valueOffset = myMat.GetTextureOffset("_TextureFeedback");
		valueOffset.x+= value;
		
		myMat.SetTextureOffset("_TextureFeedback",valueOffset);

	
	}

	public void SetValueDistort(float value)
	{
		float value2 = myMat.GetFloat("_ValueDistort");
		value2+= value;


		
		myMat.SetFloat("_ValueDistort",value2);
		myCreature.myMatBase.SetFloat("_ValueDistort",value2);
		
		
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
