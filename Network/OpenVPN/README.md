# OpenVPN

目前自己架設的 OpenVPN Server 有兩台，分別運作於美國東部與東京，其中位於美東的 OpenVPN Server 有提供 IPv6 接取。其他可以存取的 OpenVPN Server 有兩個，連接後存取位於公司的內部企業網路，

現有三台 Wi-Fi Router 使用 OpenWrt 及 OpenVPN Client 固定連線到兩台自己架設的 OpenVPN Server。為了方便檢視每台 OpenVPN Server 及 OpenVPN Client 的運作及連線狀況。需要一個監控面板，來顯示當下服務和連線的健康狀態，和紀錄斷線及重新建立連線的時間點。