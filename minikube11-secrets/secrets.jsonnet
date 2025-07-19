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
    },
    "type": "Opaque",
    "data": {
      "password": rclonePassword
    }
	}
] 
