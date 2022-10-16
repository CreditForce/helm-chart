#!/bin/bash
echo -e "\nDOWNLOAD CHART RELEASER..."
wget https://github.com/helm/chart-releaser/releases/download/v1.4.1/chart-releaser_1.4.1_linux_amd64.tar.gz
tar -zxf chart-releaser_1.4.1_linux_amd64.tar.gz

echo -e "\nCLEANING UP DEPLOY DIR..."
rm -Rf .deploy/*

echo -e "\n\nBUILDING CHARTS..."
for chrt in api-creditcollection \
            api-creditengine \
            api-creditorigination \
            api-creditstore \
            api-notification \
            api-notification-engine \
            api-rules \
            api-rules-engine \
            api-security \
            creditcollection \
            creditflow \
            creditstore \
            customerservice \
            origination-manager \
            productmodeler \
            rules-manager \
            security-manager \
            workflow-admin \
            workflow-api-admin \
            workflow-api-auth \
            workflow-api-dashboard \
            workflow-api-designer \
            workflow-api-interaction \
            workflow-base-web \
            workflow-dashboard \
            workflow-dashboard-simulator
do
  helm lint charts/$chrt
  helm package charts/$chrt --destination .deploy
done
echo -e "\n\nUPLOADING CHARTS..."
cr upload -o creditforce -r helm-chart -p .deploy --skip-existing -t $GHP_TOKEN
# cr index -i ./index.yaml -p .deploy --owner creditforce --git-repo helm-chart -t GHP_TOKEN
# git add index.yaml
# git commit -am"Update Helm chart repo index with new charts"
# git push
# echo -e "\n\nSLEEP 60..."
sleep 60
helm repo update
echo -e "\n\nBUILDING PACKGES CHARTS..."
for pckg in base \
            collection \
            origination \
            portfolio \
            rules \
            store \
            workflow
do
  helm dependency update charts/$pckg
  helm package charts/$pckg --destination .deploy
done
echo -e "\n\nUPDATING HELM REPO..."
cr upload -o creditforce -r helm-chart -p .deploy --skip-existing -t $GHP_TOKEN
cr index -i ./index.yaml -p .deploy --owner creditforce --git-repo helm-chart -t $GHP_TOKEN
git add index.yaml
git commit -am"Update Helm chart repo index with new packages"
git push









