// Shader created with Shader Forge v1.17 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.17;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:3138,x:35773,y:32660,varname:node_3138,prsc:2|emission-2819-OUT;n:type:ShaderForge.SFN_Tex2d,id:9493,x:33437,y:33538,ptovrint:False,ptlb:Perlin3,ptin:_Perlin3,varname:node_9493,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:9656,x:33167,y:33059,ptovrint:False,ptlb:Perlin4,ptin:_Perlin4,varname:node_9656,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-7042-OUT;n:type:ShaderForge.SFN_Add,id:2819,x:33414,y:33137,varname:node_2819,prsc:2|A-9656-R,B-9493-R;n:type:ShaderForge.SFN_TexCoord,id:600,x:31548,y:32854,varname:node_600,prsc:2,uv:0;n:type:ShaderForge.SFN_Distance,id:8484,x:31846,y:33070,varname:node_8484,prsc:2|A-600-UVOUT,B-3131-OUT;n:type:ShaderForge.SFN_Vector2,id:3131,x:31548,y:33095,varname:node_3131,prsc:2,v1:0.5,v2:0.5;n:type:ShaderForge.SFN_Multiply,id:5939,x:31843,y:33521,varname:node_5939,prsc:2|A-8484-OUT,B-1995-OUT;n:type:ShaderForge.SFN_Vector1,id:1995,x:31579,y:33501,varname:node_1995,prsc:2,v1:2;n:type:ShaderForge.SFN_ArcTan2,id:1467,x:32455,y:32413,varname:node_1467,prsc:2|A-8994-OUT,B-9046-OUT;n:type:ShaderForge.SFN_Subtract,id:8994,x:31976,y:32270,varname:node_8994,prsc:2|A-600-V,B-8494-OUT;n:type:ShaderForge.SFN_Vector1,id:8494,x:32239,y:32619,varname:node_8494,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Subtract,id:9046,x:31976,y:32398,varname:node_9046,prsc:2|A-600-U,B-8494-OUT;n:type:ShaderForge.SFN_Cos,id:4234,x:32809,y:32218,varname:node_4234,prsc:2|IN-3554-OUT;n:type:ShaderForge.SFN_Sin,id:4412,x:32905,y:32472,varname:node_4412,prsc:2|IN-3554-OUT;n:type:ShaderForge.SFN_Append,id:310,x:32027,y:32731,varname:node_310,prsc:2|A-4234-OUT,B-4412-OUT;n:type:ShaderForge.SFN_Add,id:3554,x:32681,y:32447,varname:node_3554,prsc:2|A-1467-OUT,B-369-OUT;n:type:ShaderForge.SFN_Multiply,id:5528,x:32359,y:32965,varname:node_5528,prsc:2|A-310-OUT,B-5939-OUT,C-4917-OUT,D-2292-OUT;n:type:ShaderForge.SFN_Add,id:7042,x:32946,y:33161,varname:node_7042,prsc:2|A-600-UVOUT,B-5528-OUT;n:type:ShaderForge.SFN_ValueProperty,id:369,x:32488,y:32744,ptovrint:False,ptlb:ValueDistort,ptin:_ValueDistort,varname:node_369,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_ValueProperty,id:2292,x:32272,y:33142,ptovrint:False,ptlb:GlobalDistoForce,ptin:_GlobalDistoForce,varname:node_2292,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Clamp01,id:8774,x:32005,y:33491,varname:node_8774,prsc:2|IN-5939-OUT;n:type:ShaderForge.SFN_Pi,id:6424,x:32123,y:33817,varname:node_6424,prsc:2;n:type:ShaderForge.SFN_Multiply,id:9270,x:32372,y:33523,varname:node_9270,prsc:2|A-1279-OUT,B-6424-OUT,C-7740-OUT;n:type:ShaderForge.SFN_Vector1,id:7740,x:32234,y:33742,varname:node_7740,prsc:2,v1:0.5;n:type:ShaderForge.SFN_OneMinus,id:1279,x:32176,y:33513,varname:node_1279,prsc:2|IN-8774-OUT;n:type:ShaderForge.SFN_Cos,id:4917,x:32565,y:33414,varname:node_4917,prsc:2|IN-9270-OUT;proporder:9493-9656-369-2292;pass:END;sub:END;*/

Shader "Shader Forge/ShaderCloudsModel" {
    Properties {
        _Perlin3 ("Perlin3", 2D) = "white" {}
        _Perlin4 ("Perlin4", 2D) = "white" {}
        _ValueDistort ("ValueDistort", Float ) = 0
        _GlobalDistoForce ("GlobalDistoForce", Float ) = 0
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend SrcAlpha OneMinusSrcAlpha
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform sampler2D _Perlin3; uniform float4 _Perlin3_ST;
            uniform sampler2D _Perlin4; uniform float4 _Perlin4_ST;
            uniform float _ValueDistort;
            uniform float _GlobalDistoForce;
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
                float node_8494 = 0.5;
                float node_3554 = (atan2((i.uv0.g-node_8494),(i.uv0.r-node_8494))+_ValueDistort);
                float node_5939 = (distance(i.uv0,float2(0.5,0.5))*2.0);
                float2 node_7042 = (i.uv0+(float2(cos(node_3554),sin(node_3554))*node_5939*cos(((1.0 - saturate(node_5939))*3.141592654*0.5))*_GlobalDistoForce));
                float4 _Perlin4_var = tex2D(_Perlin4,TRANSFORM_TEX(node_7042, _Perlin4));
                float4 _Perlin3_var = tex2D(_Perlin3,TRANSFORM_TEX(i.uv0, _Perlin3));
                float node_2819 = (_Perlin4_var.r+_Perlin3_var.r);
                float3 emissive = float3(node_2819,node_2819,node_2819);
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
