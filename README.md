# HyAlbum :camera:
Flickr의 공개피드 API를 이용해 이미지를 한장씩 보여주는 간단한 앱

## 개발 조건
- 플리커의 공개 피드(https://www.flickr.com/services/feeds/docs/photos_public/) 의 이미지를 하나씩 보여주는 전자앨범
- 앱 실행 후 "시작" 버튼을 누르면 슬라이드쇼 시작
- 슬라이드쇼 중 이미지 하나가 보이는 기간(1초~10초)을 설정할 수 있음
- 슬라이드쇼 중 백그라운드로 피드를 추가로 가져와 끊기지 않고 계속 새로운 이미지가 나오게 함
- 이미지 전환 효과는 fade-in, fade-out 만 있으면 됨
- 세로/가로모드 전환 지원
- 아이패드에서도 동작하는 유니버설 앱이어야 함
- Swift 4 or above 로 작성
- Deployment taget >= iOS 9.0
- iPhone X 지원