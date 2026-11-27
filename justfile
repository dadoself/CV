[default]
list:
    just --list

[arg('LANG', pattern='en|it')]
[arg('PLATFORM', pattern='generic|android')]
emrichen LANG PLATFORM:
    mkdir --parents "emrichen_output/{{PLATFORM}}"
    emrichen --define lang="{{LANG}}" --define platform="{{PLATFORM}}" --output-file "emrichen_output/{{PLATFORM}}/RenderCV_{{LANG}}.yaml" RenderCV.in.yaml

rendercv LANG PLATFORM: (emrichen LANG PLATFORM)
    rendercv render "emrichen_output/{{PLATFORM}}/RenderCV_{{LANG}}.yaml" --output-folder "../../rendercv_output"

publish LANG PLATFORM: (rendercv LANG PLATFORM)
    mkdir --parents "the_output/{{PLATFORM}}"
    mv "rendercv_output/{{PLATFORM}}/{{LANG}}"/*.pdf "the_output/{{PLATFORM}}"

publish-platform PLATFORM: (publish 'en' PLATFORM) (publish 'it' PLATFORM)

publish-all: (publish-platform 'generic') (publish-platform 'android')
