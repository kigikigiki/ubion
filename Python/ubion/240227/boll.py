import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from datetime import datetime

def create_band (_df, _col = 'Adj Close', _start = '2010-01-01', _end = datetime.now(), _cnt = 20) :
    
    df = _df.copy()

    # 인덱스가 Date 인가? 아니라면 Date를 인덱스로 설정
    if "Date" in df.columns :
        df.set_index("Date", inplace=True)
    
    # 인덱스를 시계열 데이터로 변경
    df.index = pd.to_datetime(df.index, format='%Y-%m-%d')

    # 시작시간과 종료시간을 시계열로 변경
    try :
        start = datetime.strptime(_start, '%Y-%m-%d')
        if type(_end) == 'str' :
            end = datetime.strptime(_end, '%Y-%m-%d')
        else :
            end = _end
    except :
        return "Type Erorr (YYYY-MM-DD)"
    
    # 결측치와 무한대값을 제외
    flag = df.isin([np.nan, np.inf, -np.inf]).any(axis = 1)
    df = df.loc[~flag,]

    # 기준이 되는 컬럼을 제외하고 모두 삭제
    result = df[[_col]]

    # 이평선, 상단밴드, 하단밴드
    result['center'] = result[_col].rolling(_cnt).mean()
    result['ub'] = result['center'] + (2 * result[_col].rolling(_cnt).std())
    result['lb'] = result['center'] - (2 * result[_col].rolling(_cnt).std())
    #print(result)
    #print(type(result.index))
    #print(start)
    #print(end)
    # 시작시간과 종료시간으로 필터링
    result = result.loc[start:end, ]

    return result        

def create_trade(_df) :
    # 기준이 되는 컬럼의 이름 변수에 저장
    col = _df.columns[0]
    
    df = _df.copy()
    
    # 거래 내역이라는 컬럼을 생성
    df['trade'] = ""
    
    # 거래 내역 추가
    for i in df.index :
        # 상단밴드보다 기준이 되는 컬럼의 값이 높거나 같은 경우
        if df.loc[i, col] >= df.loc[i, 'ub'] :
            df.loc[i,'trade'] = ""
        # 하단밴드보다 col의 값이 작거나 같은 경우
        elif df.loc[i, col] <= df.loc[i, 'lb'] :
            df.loc[i,'trade'] = 'buy'
        # 밴드 사이의 col값이 존재하는 경우
#         else :
#             if df.shift().loc[i, 'trade'] == 'buy':
#                 df.loc[i, 'trade'] = 'buy'
#             else :
#                 df.loc[i, 'trade'] = ""
        else :
            df.loc[i, 'trade'] = df.shift().loc[i,'trade']
    return df

def creat_rtn (_df) :
    col = _df.colums[0]
    
    df = _df
    
    df['rtn'] = 1
    
    for i in df.index :
        if (df.shift().loc[i, 'trade']== "") & (df.loc[i, 'trade'] == 'buy') :
            buy = df.loc[i, col]
            print(f"매수일 : {i}, 매수가 : {buy}")
        
        elif (df.shift().loc[i, 'trade'] == "buy") & (df.loc[i,'trade'] == "") :
                  sell = df.loc[i, col]
                  rtn = sell/buy
                  print(f"매도일 : {i}, 매도가 : {sell}, 수익률 : {rtn}")
                  df.loc[i, 'rtn'] = rtn
                  
    df['acc_rtn'] = df['rtn'].cumprod()
    acc_rtn = df.iloc[-1,]['acc_rtn']
    return df, acc_rtn