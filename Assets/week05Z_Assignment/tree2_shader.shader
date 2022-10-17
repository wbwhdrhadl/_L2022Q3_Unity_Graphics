Shader "Custom/tree2_shader"
{
        Properties
        {
            _Color("Color", Color) = (1,1,1,1)
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
                fixed4 c = tex2D(_MainTex, IN.uv_MainTex + _Time.x);
                o.Albedo = c.rgb;
                o.Emission = float3(0.3, 0, 1);
                o.Alpha = c.a;
            }
            ENDCG
        }
            FallBack "Diffuse"
    }
