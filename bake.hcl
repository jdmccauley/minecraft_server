group "default" {
    targets = ["server", "onedrive"]
}

target "server" {
    dockerfile = "Dockerfile"
    tags = ["mc_java_server:latest"]
    args = {
        "TARGET": "server"
    }
}

target "onedrive" {
    dockerfile = "Dockerfile"
    tags = ["mc_java_onedrive:latest"]
    args = {
        "TARGET": "onedrive"
    }
}