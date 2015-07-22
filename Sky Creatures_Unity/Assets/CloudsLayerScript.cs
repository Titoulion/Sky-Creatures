using UnityEngine;
using System.Collections;

public class CloudsLayerScript : MonoBehaviour {

	// Use this for initialization

	Material myMat;

	public Vector2 minMaxCloud;
	public AnimationCurve curveVanish;

	void Start () {
		myMat = GetComponent<Renderer>().material;
	}
	
	// Update is called once per frame
	void Update () {
	
	}

	public void Vanish(float progress)
	{
		myMat.SetFloat ("_SizeClouds", Mathf.Lerp(minMaxCloud.x,minMaxCloud.y,curveVanish.Evaluate(progress)));
	}
}
