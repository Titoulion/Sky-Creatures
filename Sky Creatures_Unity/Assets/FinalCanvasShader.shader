// Shader created with Shader Forge v1.17 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.17;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:3138,x:35700,y:32861,varname:node_3138,prsc:2|emission-3967-OUT;n:type:ShaderForge.SFN_Tex2d,id:7912,x:32417,y:32723,ptovrint:False,ptlb:Clouds1,ptin:_Clouds1,varname:node_7912,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:8354,x:32406,y:33194,ptovrint:False,ptlb:Clouds3,ptin:_Clouds3,varname:node_8354,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:9544,x:32417,y:32905,ptovrint:False,ptlb:Clouds2,ptin:_Clouds2,varname:node_9544,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Lerp,id:8097,x:33706,y:32795,varname:node_8097,prsc:2|A-7912-RGB,B-9544-RGB,T-2229-OUT;n:type:ShaderForge.SFN_Tex2d,id:5544,x:32406,y:33372,ptovrint:False,ptlb:Clouds4,ptin:_Clouds4,varname:node_5544,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Slider,id:5069,x:32984,y:33136,ptovrint:False,ptlb:ValueTransition1,ptin:_ValueTransition1,varname:node_5069,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-1,cur:0,max:1;n:type:ShaderForge.SFN_Slider,id:5062,x:32782,y:33751,ptovrint:False,ptlb:ValueTransition2,ptin:_ValueTransition2,varname:node_5062,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-1,cur:0,max:1;n:type:ShaderForge.SFN_Slider,id:1084,x:34456,y:33521,ptovrint:False,ptlb:TransitionValue3,ptin:_TransitionValue3,varname:node_1084,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-1,cur:0,max:1;n:type:ShaderForge.SFN_Tex2d,id:6973,x:32680,y:32968,ptovrint:False,ptlb:Perlin1,ptin:_Perlin1,varname:node_6973,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Posterize,id:6228,x:33337,y:32911,varname:node_6228,prsc:2|IN-1153-OUT,STPS-4553-OUT;n:type:ShaderForge.SFN_Vector1,id:4553,x:33337,y:33066,varname:node_4553,prsc:2,v1:2;n:type:ShaderForge.SFN_Add,id:2804,x:32923,y:32951,varname:node_2804,prsc:2|A-6973-R,B-5069-OUT;n:type:ShaderForge.SFN_Clamp01,id:1153,x:33103,y:32951,varname:node_1153,prsc:2|IN-2804-OUT;n:type:ShaderForge.SFN_Clamp01,id:2229,x:33522,y:32882,varname:node_2229,prsc:2|IN-6228-OUT;n:type:ShaderForge.SFN_Add,id:8048,x:32870,y:33526,varname:node_8048,prsc:2|A-2323-R,B-5062-OUT;n:type:ShaderForge.SFN_Clamp01,id:1752,x:33050,y:33526,varname:node_1752,prsc:2|IN-8048-OUT;n:type:ShaderForge.SFN_Posterize,id:1679,x:33284,y:33486,varname:node_1679,prsc:2|IN-1752-OUT,STPS-4713-OUT;n:type:ShaderForge.SFN_Clamp01,id:6746,x:33428,y:33534,varname:node_6746,prsc:2|IN-1679-OUT;n:type:ShaderForge.SFN_Vector1,id:4713,x:33284,y:33641,varname:node_4713,prsc:2,v1:2;n:type:ShaderForge.SFN_Lerp,id:6451,x:33646,y:33420,varname:node_6451,prsc:2|A-8354-RGB,B-5544-RGB,T-6746-OUT;n:type:ShaderForge.SFN_Tex2d,id:2323,x:32664,y:33464,ptovrint:False,ptlb:Perlin2,ptin:_Perlin2,varname:node_2323,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Add,id:3996,x:34456,y:33345,varname:node_3996,prsc:2|A-9897-R,B-1084-OUT;n:type:ShaderForge.SFN_Clamp01,id:174,x:34626,y:33345,varname:node_174,prsc:2|IN-3996-OUT;n:type:ShaderForge.SFN_Posterize,id:8938,x:34906,y:33333,varname:node_8938,prsc:2|IN-174-OUT,STPS-2857-OUT;n:type:ShaderForge.SFN_Vector1,id:2857,x:34906,y:33498,varname:node_2857,prsc:2,v1:2;n:type:ShaderForge.SFN_Clamp01,id:6225,x:35176,y:33293,varname:node_6225,prsc:2|IN-8938-OUT;n:type:ShaderForge.SFN_Lerp,id:3967,x:35426,y:32963,varname:node_3967,prsc:2|A-8097-OUT,B-6451-OUT,T-6225-OUT;n:type:ShaderForge.SFN_Tex2d,id:9897,x:34153,y:33461,ptovrint:False,ptlb:Perlin3,ptin:_Perlin3,varname:node_9897,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;proporder:7912-9544-5069-6973-8354-5544-5062-1084-2323-9897;pass:END;sub:END;*/

Shader "Shader Forge/FinalCanvasShader" {
    Properties {
        _Clouds1 ("Clouds1", 2D) = "white" {}
        _Clouds2 ("Clouds2", 2D) = "white" {}
        _ValueTransition1 ("ValueTransition1", Range(-1, 1)) = 0
        _Perlin1 ("Perlin1", 2D) = "white" {}
        _Clouds3 ("Clouds3", 2D) = "white" {}
        _Clouds4 ("Clouds4", 2D) = "white" {}
        _ValueTransition2 ("ValueTransition2", Range(-1, 1)) = 0
        _TransitionValue3 ("TransitionValue3", Range(-1, 1)) = 0
        _Perlin2 ("Perlin2", 2D) = "white" {}
        _Perlin3 ("Perlin3", 2D) = "white" {}
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform sampler2D _Clouds1; uniform float4 _Clouds1_ST;
            uniform sampler2D _Clouds3; uniform float4 _Clouds3_ST;
            uniform sampler2D _Clouds2; uniform float4 _Clouds2_ST;
            uniform sampler2D _Clouds4; uniform float4 _Clouds4_ST;
            uniform float _ValueTransition1;
            uniform float _ValueTransition2;
            uniform float _TransitionValue3;
            uniform sampler2D _Perlin1; uniform float4 _Perlin1_ST;
            uniform sampler2D _Perlin2; uniform float4 _Perlin2_ST;
            uniform sampler2D _Perlin3; uniform float4 _Perlin3_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
/////// Vectors:
////// Lighting:
////// Emissive:
                float4 _Clouds1_var = tex2D(_Clouds1,TRANSFORM_TEX(i.uv0, _Clouds1));
                float4 _Clouds2_var = tex2D(_Clouds2,TRANSFORM_TEX(i.uv0, _Clouds2));
                float4 _Perlin1_var = tex2D(_Perlin1,TRANSFORM_TEX(i.uv0, _Perlin1));
                float node_4553 = 2.0;
                float3 node_8097 = lerp(_Clouds1_var.rgb,_Clouds2_var.rgb,saturate(floor(saturate((_Perlin1_var.r+_ValueTransition1)) * node_4553) / (node_4553 - 1)));
                float4 _Clouds3_var = tex2D(_Clouds3,TRANSFORM_TEX(i.uv0, _Clouds3));
                float4 _Clouds4_var = tex2D(_Clouds4,TRANSFORM_TEX(i.uv0, _Clouds4));
                float4 _Perlin2_var = tex2D(_Perlin2,TRANSFORM_TEX(i.uv0, _Perlin2));
                float node_4713 = 2.0;
                float4 _Perlin3_var = tex2D(_Perlin3,TRANSFORM_TEX(i.uv0, _Perlin3));
                float node_2857 = 2.0;
                float3 emissive = lerp(node_8097,lerp(_Clouds3_var.rgb,_Clouds4_var.rgb,saturate(floor(saturate((_Perlin2_var.r+_ValueTransition2)) * node_4713) / (node_4713 - 1))),saturate(floor(saturate((_Perlin3_var.r+_TransitionValue3)) * node_2857) / (node_2857 - 1)));
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
