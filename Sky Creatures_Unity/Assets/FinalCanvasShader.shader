// Shader created with Shader Forge v1.17 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.17;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:3138,x:33753,y:32709,varname:node_3138,prsc:2|emission-8097-OUT;n:type:ShaderForge.SFN_Tex2d,id:7912,x:32417,y:32723,ptovrint:False,ptlb:Clouds1,ptin:_Clouds1,varname:node_7912,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:8354,x:32417,y:33116,ptovrint:False,ptlb:Clouds3,ptin:_Clouds3,varname:node_8354,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:9544,x:32417,y:32920,ptovrint:False,ptlb:Clouds2,ptin:_Clouds2,varname:node_9544,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Lerp,id:8097,x:33278,y:32805,varname:node_8097,prsc:2|A-7912-RGB,B-9544-RGB,T-5195-OUT;n:type:ShaderForge.SFN_Tex2d,id:6610,x:32677,y:32993,ptovrint:False,ptlb:LerpClouds,ptin:_LerpClouds,varname:node_6610,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:5544,x:32464,y:33377,ptovrint:False,ptlb:Clouds4,ptin:_Clouds4,varname:node_5544,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Lerp,id:7256,x:32797,y:33333,varname:node_7256,prsc:2|A-8354-RGB,B-5544-RGB;n:type:ShaderForge.SFN_RemapRange,id:6173,x:33305,y:33262,varname:node_6173,prsc:2,frmn:0,frmx:1,tomn:-1,tomx:1|IN-7469-OUT;n:type:ShaderForge.SFN_Slider,id:7469,x:32947,y:33268,ptovrint:False,ptlb:node_7469,ptin:_node_7469,varname:node_7469,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Add,id:7293,x:32965,y:33003,varname:node_7293,prsc:2|A-6610-R,B-6173-OUT;n:type:ShaderForge.SFN_Clamp01,id:4698,x:33122,y:33003,varname:node_4698,prsc:2|IN-7293-OUT;n:type:ShaderForge.SFN_Posterize,id:5195,x:33319,y:33003,varname:node_5195,prsc:2|IN-4698-OUT,STPS-7349-OUT;n:type:ShaderForge.SFN_ValueProperty,id:7349,x:33497,y:32976,ptovrint:False,ptlb:PosterizeStrength,ptin:_PosterizeStrength,varname:node_7349,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;proporder:7912-9544-6610-7469-7349;pass:END;sub:END;*/

Shader "Shader Forge/FinalCanvasShader" {
    Properties {
        _Clouds1 ("Clouds1", 2D) = "white" {}
        _Clouds2 ("Clouds2", 2D) = "white" {}
        _LerpClouds ("LerpClouds", 2D) = "white" {}
        _node_7469 ("node_7469", Range(0, 1)) = 0
        _PosterizeStrength ("PosterizeStrength", Float ) = 0
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
            uniform sampler2D _Clouds2; uniform float4 _Clouds2_ST;
            uniform sampler2D _LerpClouds; uniform float4 _LerpClouds_ST;
            uniform float _node_7469;
            uniform float _PosterizeStrength;
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
                float4 _LerpClouds_var = tex2D(_LerpClouds,TRANSFORM_TEX(i.uv0, _LerpClouds));
                float3 node_8097 = lerp(_Clouds1_var.rgb,_Clouds2_var.rgb,floor(saturate((_LerpClouds_var.r+(_node_7469*2.0+-1.0))) * _PosterizeStrength) / (_PosterizeStrength - 1));
                float3 emissive = node_8097;
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
