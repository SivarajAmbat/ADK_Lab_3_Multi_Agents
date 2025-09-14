gemini; exit
cloudshell workspace ~
gcloud storage cp -r gs://qwiklabs-gcp-03-943523166166-bucket/adk_multiagent_systems .
export PATH=$PATH:"/home/${USER}/.local/bin"
python3 -m pip install google-adk -r adk_multiagent_systems/requirements.txt
cd ~/adk_multiagent_systems
cat << EOF > parent_and_subagents/.env
GOOGLE_GENAI_USE_VERTEXAI=TRUE
GOOGLE_CLOUD_PROJECT=qwiklabs-gcp-03-943523166166
GOOGLE_CLOUD_LOCATION=us-central1
MODEL=gemini-2.5-flash
EOF

cp parent_and_subagents/.env workflow_agents/.env
cd ~/adk_multiagent_systems
adk run parent_and_subagents
adk run parent_and_subagents
adk web
adk web --reload-agents
cd ~/adk_multiagent_systems
adk web --reload_agents
