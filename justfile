[arg('LANG', pattern='en|it')]
[arg('PLATFORM', pattern='generic|android')]
emrichen LANG PLATFORM:
    mkdir --parents emrichen_output
    emrichen --define lang={{LANG}} --define platform={{PLATFORM}} --output-file emrichen_output/RenderCV_{{LANG}}_{{PLATFORM}}.yaml RenderCV.in.yaml

rendercv LANG PLATFORM: (emrichen LANG PLATFORM)
    rendercv render emrichen_output/RenderCV_{{LANG}}_{{PLATFORM}}.yaml
