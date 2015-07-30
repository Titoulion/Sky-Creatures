using UnityEngine;
using System.Collections;

public class TimeCircleScript : MonoBehaviour {

	// Use this for initialization
	MainScript main;
	public float myRank = 0f;
	bool transforming = false;
	float progressTransforming = 0f;
	Vector3 initPos;
	Material myMat;

	float nextTime;
	float randomSize;
	public AnimationCurve curveSize;

	void Start () {
		main = MainScript.Instance;
		initPos = transform.position;
		myMat = GetComponent<Renderer>().material;
		nextTime = Random.value*0.25f;
		randomSize = Random.Range (0.9f,1.1f);
	}
	
	// Update is called once per frame
	void Update () 
	{
		Progresss();
		Transformation();
	}

	void Transformation()
	{
		if(transforming)
		{
			progressTransforming+=Time.deltaTime;
		}
		else
		{
			progressTransforming-=Time.deltaTime;
		}

		nextTime-=Time.deltaTime;
		if(nextTime<=0f)
		{
			nextTime=Random.value*0.25f;
			transform.position = initPos+Vector3.right*Random.Range (-0.3f,0.3f)+Vector3.up*Random.Range(-0.3f,0.3f);
			randomSize = Random.Range (0.9f,1.1f);
		}


		progressTransforming = Mathf.Clamp01(progressTransforming);




		transform.localScale = Vector3.one*6f*(curveSize.Evaluate(progressTransforming))*randomSize;


		myMat.SetColor ("_TintColor",new Color(1f,1f,1f,(1f-progressTransforming)*0.75f));


	}

	public void Progresss()
	{
		float progress = main.progressTimer;
		if(progress>myRank+(1f/120f))
		{
			transforming = true;
		}
		else
		{
			transforming = false;
		}


	}


}
