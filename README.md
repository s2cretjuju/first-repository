# AIFFEL Campus Online Code Peer Review Templete
- 코더 : 서주연
- 리뷰어 : 이기화

# PRT(Peer Review Template)
- [O]  **1. 주어진 문제를 해결하는 완성된 코드가 제출되었나요?**
          가위바위보 이미지 데이터를 호출, 리사이즈 및 정규화하여 학습 데이터로 준비하고, CNN 모델을 설계 및 학습시킨 후,
          테스트 데이터로 성능을 평가하는 일련의 과정이 완성되어 제출되었다.
          <img width="743" height="182" alt="image" src="https://github.com/user-attachments/assets/017805c2-5903-4fe1-a5ff-4ab977669f1b" />
    
- [O]  **2. 전체 코드에서 가장 핵심적이거나 가장 복잡하고 이해하기 어려운 부분에 작성된 
주석 또는 doc string을 보고 해당 코드가 잘 이해되었나요?**
         각 코드에 주석이 있어 코드의 사용 목적에 대해 이해할 수 있었으며, load_data 함수에서 이미지 경로 설정과 라벨링(가위: 0, 바위: 1, 보: 2)에 대한 설명이 잘 되어 있어
         데이터 준비 과정을 쉽게 이해할 수 있었다.
          <img width="664" height="222" alt="image" src="https://github.com/user-attachments/assets/570e41d9-d341-4895-9c31-9867f0b4c27a" />
        
- [O]  **3. 에러가 난 부분을 디버깅하여 문제를 해결한 기록을 남겼거나
새로운 시도 또는 추가 실험을 수행해봤나요?**
        노드에 제시된 파라미터 외에 5가지 다른 하이퍼파라미터 조합으로 추가 실험을 진행하고 그 결과를 명확히 비교했다.
        최종적으로 Accuracy 0.64 을 달성한 파라미터 조합을 명시했다.
        <img width="774" height="860" alt="image" src="https://github.com/user-attachments/assets/9db0a3b0-9b43-4a39-b362-36bd332ca29f" />
        <img width="675" height="131" alt="image" src="https://github.com/user-attachments/assets/4ce7e855-3471-4149-b46e-9b8828ac08f8" />  
        
- [O]  **4. 회고를 잘 작성했나요?**
-         아래와 같이 회고를 작성하였다
         <img width="892" height="530" alt="image" src="https://github.com/user-attachments/assets/43cc249c-5578-49dd-b4cd-3306d914a592" />
        
- [O]  **5. 코드가 간결하고 효율적인가요?**
          이미지 리사이즈 및 데이터 로드 부분을 함수(resize_images, load_data)로 모듈화하여 코드의 중복을 줄였다. 데이터 로드 후 정규화를 수행한 것도 효율적인 데이터 처리 방식으로 보인다.

# 회고(참고 링크 및 코드 개선)
```
주연님은 다양한 파라미터로 실험하여 0.64의 성능을 달성하는 등 여러 시도를 통해 가장 높은 정확도를 얻으려는 노력이 보였다. 특히 28X28의 낮은 해상도와 데이터 부족이 성능 한계의 원인임을 명시했다. 
리사이즈 함수에서 최신 버전 호환성(ANTIALIAS -> LANCZOS)을 고려한 주석을 추가하여 리뷰어로 하여금 코드를 잘 이해할 수 있도록 하였다. 다른 그루들도 모두가 같은 조건이었지만, 다음 시도에는 데이터 수를 늘리고, 전처리를 통해서 과적합을 방지하고, 더 안정적인 결과를 얻을 수 있을 것 같다. 
```
