---
title: JQ usage example
description: using jq instead of jsonpath
date: 2022-02-14
slug: jq-example
#image: helena-hertz-wWZzXlDpMog-unsplash.jpg
categories:
    - k8s
    - json
---

- jq cli to parser k8s secrets etc.
```shell!
kubectl get secrets -n gitlab  gitlab-postgresql-password -o json |\
 jq -r '.data."postgresql-password"' |base64 --decode   

kubectl get secrets -n gitlab gitlab-gitlab-initial-root-password -o json |\
jq -r '.data."password"' |base64 --decode    

```