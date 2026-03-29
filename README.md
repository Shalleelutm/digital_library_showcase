## 📁 Project Structure

digital_library_showcase/
├── .github/workflows/     # CI/CD pipeline
├── docs/images/           # Screenshots & diagrams
├── web/                   # Flutter web build
├── Dockerfile             # Container setup
├── README.md              # Project documentation

## 🧩 Challenges Solved

- Fixed Docker port binding issues (port 80 conflict)
- Resolved SSH key permission errors on Windows
- Debugged GitHub Actions deployment failures
- Configured Nginx inside Docker container
- Ensured Flutter web build works in production

[![Deploy to EC2](https://github.com/Shalleelutm/digital_library_showcase/actions/workflows/flutter.yml/badge.svg)](https://github.com/Shalleelutm/digital_library_showcase/actions/workflows/flutter.yml)
![Docker](https://img.shields.io/badge/Docker-Containerized-blue)
![AWS](https://img.shields.io/badge/AWS-EC2-orange)
![CI/CD](https://img.shields.io/badge/GitHub%20Actions-CI/CD-green)
![Flutter](https://img.shields.io/badge/Flutter-Web-blue)

# 📚 Digital Library DevOps Project

A full-stack Flutter Web application deployed on AWS EC2 using Docker and Nginx, with CI/CD powered by GitHub Actions.

## 🏗️ Architecture Diagram

![Architecture](docs/images/architecture.png)

---

## 🚀 Live Demo

👉 http://16.171.64.218

---

## 📱 Platform Support

- ✅ Web (Primary)
- ✅ Mobile UI compatible (Flutter responsive design)

---

## 🧱 Tech Stack

- Flutter (Frontend)
- Docker (Containerization)
- Nginx (Web Server)
- AWS EC2 (Cloud Hosting)
- GitHub Actions (CI/CD)

---

## 🏗️ Architecture
User → Browser → AWS EC2 → Docker Container → Nginx → Flutter Web App

---

## ⚙️ Deployment Flow

1. Code pushed to GitHub
2. GitHub Actions pipeline triggers
3. Flutter web build generated
4. Docker image is built
5. Container runs on AWS EC2
6. Nginx serves app on port 80

---

## 📸 Screenshots

### Home Screen
![Home](docs/images/screen1.jpeg)

### Library View
![Library](docs/images/screen2.jpeg)

### UI Example
![UI](docs/images/screen3.jpeg)

---

## 🧠 What I Learned

- Docker containerization
- CI/CD automation with GitHub Actions
- AWS EC2 deployment and networking
- Debugging real production issues
- Linux server management
- Secure SSH key handling

---

## 📌 Future Improvements

- HTTPS with domain (Route53 + SSL)
- Auto deployment pipeline
- Monitoring (CloudWatch / Grafana)
- Load balancing

---

## 👨‍💻 Author

S.M
