Shader "My/Quad"
{
    Properties
    {
        _MainTex("Albedo (RGB)", 2D) = "white" {}
        _MainTex2("Albedo (RGB)",2D) = "white" {}
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }

        CGPROGRAM
        #pragma surface surf Standard fullforwardshadows

        sampler2D _MainTex;
        sampler2D _MainTex2;


        struct Input
        {
            float2 uv_MainTex;
            float2 uv_MainTex2;
        };


        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            // Albedo comes from a texture tinted by color
            fixed4 c = tex2D (_MainTex, IN.uv_MainTex );
            fixed4 D = tex2D(_MainTex2, IN.uv_MainTex2 + _Time.y);


            o.Albedo = c.rgb;
            //o.Emission = IN.uv_MainTex.y;
            o.Emission = float3(IN.uv_MainTex.x, IN.uv_MainTex.y, 0);
  
            o.Alpha = c.a;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
