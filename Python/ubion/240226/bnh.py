import pandas as pd
import numpy as np
from datetime import datetime
## Buy and Hold 함수화
## 매개변수는 데이터프레임, 기준이 되는 컬럼, 시작시간, 종료시간
## 기준이 되는 컬럼은 기본값 Adj close
## 시작시간 2000-01-01 기본값으로 설정
## 종료시간 today 기본값으로 설정

def buyandhold(_df, 
               _col = 'Adj Close', 
               _start = '2010-01-01', 
               _end = datetime.now()) :
    try :
        # _start는 시계열 데이터로 변경
        start = datetime.strptime(_start, "%Y-%m-%d")
        # _end는 문자열 데이터라면 시계열로, 시계열데이터라면 end = _end
        if type(_end) == 'str' :
            end = datetime.strptime(_end, "%Y-%m-%d")
        else :
            end = _end
    except:
        return "Type Error(YYYY-MM-DD)"
    # _df의 복사본을 생성
    df = _df.copy()
    
    # 컬럼에 Date 포함되어 있는가?
    if 'Date' in df.columns :
        # Date 컬럼을 인덱스로 변경
        df.set_index('Date', inplace = True)
        
    # index를 시계열 데이터로 변경
    df.index = pd.to_datetime(df.index, format='%Y-%m-%d')
    
    # 시작시간과 종료시간을 기준으로 필터
    # 특정 컬럼의 데이터만 필터
    result = df.loc[start : end , [_col]]
    
    # 일별 수익을 칼럼을 생성
    result['daily_rtn'] = (result[_col].pct_change()+1).fillna(1)
    
    # 누적수익률을 계산하여 새로운 컬럼에 대입
    result['acc_rtn'] = result['daily_rtn'].cumprod()
    
    acc_rtn = result.iloc[-1,2]
    
    return result, acc_rtn