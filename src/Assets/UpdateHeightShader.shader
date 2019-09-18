Shader "Unlit/UpdateHeightShader"
{
	Properties
	{
		_VelocityTex("Velocity Map", 2D) = "white" {}
	}
	SubShader
	{
		Cull Off
		ZWrite Off
		ZTest Always

		Tags { "RenderType" = "Opaque" "Queue" = "Geometry+1" }

		Pass
		{
			CGPROGRAM
			#include "UnityCustomRenderTexture.cginc"
			#pragma vertex CustomRenderTextureVertexShader
			#pragma fragment frag

			sampler2D _VelocityTex;

			float4 frag(v2f_customrendertexture   i) : SV_Target
			{
				float2 v = tex2D(_VelocityTex, i.localTexcoord);
				return tex2D(_SelfTexture2D, i.localTexcoord + 0.01 * v);
			}
			ENDCG
		}
	}
}
