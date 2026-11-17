[arg('LANG', pattern='en|it')]
emrichen LANG:
    mkdir --parents emrichen_output
    emrichen --define lang={{LANG}} --output-file emrichen_output/RenderCV_{{LANG}}.yaml RenderCV.in.yaml

rendercv LANG: (emrichen LANG)
    rendercv render emrichen_output/RenderCV_{{LANG}}.yaml
