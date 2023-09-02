# Pixlet Pusher

## How to use

This addon relies on Home Assistant service calls to function. Once installed, it can be triggered using the `hassio.addon_stdin` service. For example, using the Home Assistant Developer Tools > Services, the below payload triggers a message on the Tidbyt device.
```yaml
service: hassio.addon_stdin
data:
  addon: <some prefix>_pixlet_pusher
  input:
    device_id: "<some device id>"
    api_token: "<some api token>"
    script: |
      load("render.star", "render")
      def main():
        return render.Root(
          child=render.Text("Hello, from HA!")
        )
```
The device ID and API token can be obtained from the Tidbyt app by going to Settings > General, and tapping on 'Get API Key'.

