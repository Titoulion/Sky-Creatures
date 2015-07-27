using UnityEngine;
using System.Collections;



public class RenderModelClouds : MonoBehaviour 
{
	public Material matTexture;
	public RenderTexture rt;

	Material matClouds1;
	public GameObject clouds1;

	public static RenderModelClouds Instance;
	
	
	
	void Awake ()
	{

		Instance = this;
		rt = new RenderTexture(1024,1024,0);

		//clouds1.GetComponent<Renderer>().material = matClouds1;
		matClouds1 = clouds1.GetComponent<Renderer>().material;
	
		
	}
	
	void Update()
	{
		//if camera not found, this will blit on update, which is probably too often
		//so maybe use a Coroutine or something to control how often this renders

			Render();

		
		//Debug.Log (textureWorld.GetPixel (10,10));
		
	}
	
	//called if script attached to a camera
	//renders each time the camera renders

	
	
	void Render()
	{
		if ( matTexture != null && rt != null )
		{
			//specifies the texture to be written into
			Graphics.SetRenderTarget(rt);
			
			
			
			
			//clear the render texture, if needed (if using a Blend mode in the shader etc)
			//GL.Clear(true, true, Color.black);
			
			//says which pass of this material's shader to use
			matTexture.SetPass(0); //draw UVs
			//mat.SetPass(1); //etc
			
			//draws fullscreen quad, using the pass set above
			DrawFullscreenQuad();
			//globally reference the render texture just rendered into..
			//setting to null makes active render target the screen (as it normally is)
			matClouds1.SetTexture("_ModelClouds",rt);
			//RenderTexture.active = rt;

			Graphics.SetRenderTarget( (RenderTexture) null );
			
		}
	}




	
	

	
	public static void DrawFullscreenQuad(float z=0.0f)
	{
		GL.PushMatrix();
		GL.LoadOrtho();
		GL.Begin(GL.QUADS);
		
		GL.TexCoord2(0.0f, 0.0f); GL.Vertex3(0f, 1f, z);
		GL.TexCoord2(1.0f, 0.0f); GL.Vertex3(1f, 1f, z);
		GL.TexCoord2(1.0f, 1.0f); GL.Vertex3(1f, 0f, z);
		GL.TexCoord2(0.0f, 1.0f); GL.Vertex3(0f, 0f, z);
		
		GL.End();
		GL.PopMatrix();
	}
}

