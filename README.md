# kube-deployment-strategies
Most Common Kubernetes Deployment Strategies, also a way to deploy helm with terraform

## Recreate
The Recreate deployment strategy in Kubernetes is a way to update a Deployment by terminating all the existing Pods before creating new ones. This strategy ensures that only the new version of the application is running at any given time, but it does result in downtime during the update process.

## Rolling Update
A Rolling Update in Kubernetes is a deployment strategy used to update applications with zero downtime by incrementally replacing old Pods with new ones. This strategy ensures that some Pods of the application are always available to handle requests during the update process.
```sh
    rollingUpdate:
      maxSurge: 1
      maxUnavailable: 1

#or
      maxUnavailable: 25%
      maxSurge: 25%
```
## Blue Green
The Blue-Green Deployment Strategy in Kubernetes is a technique for releasing application updates by creating two separate environments: Blue (current/active version) and Green (new version). Traffic is initially routed to the Blue environment, and once the Green environment is verified, traffic is switched to it, effectively making it the active environment.
```sh
spec:
  replicas: 2
  selector:
    matchLabels:
      app: myapp
      replica: green

#or

spec:
  replicas: 2
  selector:
    matchLabels:
      app: myapp
      replica: blue
```

## Canary
A Canary Deployment in Kubernetes is a progressive deployment strategy where new versions of an application are rolled out to a small subset of users initially. Based on the performance and behavior of the new version, the rollout is gradually expanded to a larger audience until the new version completely replaces the old one.
This approach minimizes risk by allowing you to test updates in a controlled manner.

```sh
# increase the 
spec:
  replicas: 0
# in the canary yaml
```