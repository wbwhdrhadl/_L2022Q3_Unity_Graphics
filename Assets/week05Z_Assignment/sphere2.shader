Shader "Custom/sphere2"
{
    Properties
    {
        _MainTex("Albedo (RGB)", 2D) = "white" {}
    }

        SubShader
        {
            Tags { "RenderType" = "Opaque" }


            CGPROGRAM
            #pragma surface surf Standard fullforwardshadows

            sampler2D _MainTex;


            struct Input
            {
                float2 uv_MainTex;

            };


            void surf(Input IN, inout SurfaceOutputStandard o)
            {
                // Albedo comes from a texture tinted by color
                fixed4 c = tex2D(_MainTex, IN.uv_MainTex+0.1);

                o.Albedo = c.rgb;
                o.Emission  = float3(IN.uv_MainTex.y, IN.uv_MainTex.x, 0);
                o.Alpha = c.a;
            }
            ENDCG
        }
            FallBack "Diffuse"
}
   