function (
    rclonePassword="xxx"
)
[
	{
    "apiVersion": "v1",
    "kind": "Secret",
    "metadata": {
      "name": "rclone-password",
      "namespace": "default",
      "annotations": {
        "reflector.v1.k8s.emberstack.com/reflection-allowed": "true"
      }
    },
    "type": "Opaque",
    "data": {
      "password": rclonePassword
    }
	}
] 
