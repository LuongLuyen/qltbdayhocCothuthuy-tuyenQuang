use qltb;

Insert into home_user(userName,password,role) values('admin','admin','ADMIN');
Insert into home_user(userName,password,role) values('nguoidung','nguoidung','USER');

-- lab
Insert into home_device(userId_id,name,code,unit,price,quantity,status,date,location) 
values(1,'Hóa Học 1','LABHH1T1','phòng','#','1','#','#','#');

Insert into home_device(userId_id,name,code,unit,price,quantity,status,date,location) 
values(1,'Vật Lí - CN 1','LABVLCN1T2','phòng','#','1','#','#','#');

Insert into home_device(userId_id,name,code,unit,price,quantity,status,date,location) 
values(1,'Tin Học 2','LABTH2T3','phòng','#','1','#','#','#');
Insert into home_device(userId_id,name,code,unit,price,quantity,status,date,location) 
values(1,'Sinh Học 1','LABSH1T3','phòng','#','1','#','#','#');

Insert into home_device(userId_id,name,code,unit,price,quantity,status,date,location) 
values(1,'Tin Học 1','LABTH1T4','phòng','#','1','#','#','#');
Insert into home_device(userId_id,name,code,unit,price,quantity,status,date,location) 
values(1,'Tin Học 3','LABTH3T4','phòng','#','1','#','#','#');
Insert into home_device(userId_id,name,code,unit,price,quantity,status,date,location) 
values(1,'Sinh Học 2','LABSH2T4','phòng','#','1','#','#','#');
Insert into home_device(userId_id,name,code,unit,price,quantity,status,date,location) 
values(1,'Vật Lí - CN 2','LABVLCN2T4','phòng','#','1','#','#','#');
Insert into home_device(userId_id,name,code,unit,price,quantity,status,date,location) 
values(1,'Trực tuyến','LABTTT4','phòng','#','1','#','#','#');
Insert into home_device(userId_id,name,code,unit,price,quantity,status,date,location) 
values(1,'Hóa Học 2','LABHH2KT','phòng','#','1','#','#','#');
-- device
Insert into home_device(userId_id,name,code,unit,price,quantity,status,date,location) 
values(1,'Video/clip/ Phim tư liệu về truyện cổ dân gian Việt Nam','NVH.NV.Vid.2023/01-01/04','Bộ','202.500','5','mới','21-11-2023','việt nam');
Insert into home_device(userId_id,name,code,unit,price,quantity,status,date,location) 
values(1,'Video/clip/ Phim tư liệu về ca dao con người và xã hội','NVH.NV.Vid.2023/01-01/04','Bộ','202.500','5','mới','21-11-2023','việt nam');
Insert into home_device(userId_id,name,code,unit,price,quantity,status,date,location) 
values(1,'Video/clip/ Phim tư liệu về thơ nôm của Hồ Xuân Hương','NVH.NV.Vid.2023/01-01/04','Bộ','202.500','5','mới','21-11-2023','việt nam');
Insert into home_device(userId_id,name,code,unit,price,quantity,status,date,location) 
values(1,'Video/clip/ Phim tư liệu về thơ của Nguyễn Khuyến','NVH.NV.Vid.2023/01-01/04','Bộ','202.500','5','mới','21-11-2023','việt nam');
Insert into home_device(userId_id,name,code,unit,price,quantity,status,date,location) 
values(1,'Sơ đồ quy trình và cấu trúc một báo cáo nghiên cứu khoa học','NVH.NV.SĐ.2023/01-01/04','Bộ','27.000','5','mới','21-11-2023','việt nam');
Insert into home_device(userId_id,name,code,unit,price,quantity,status,date,location) 
values(1,'Sơ đồ quy trình tiến hành sân khấu hóa một tác phẩm văn học','NVH.NV.SĐ.2023/01-01/04','Bộ','27.000','5','mới','21-11-2023','việt nam');
Insert into home_device(userId_id,name,code,unit,price,quantity,status,date,location) 
values(1,'Giá treo tranh','NVH.VAN.GIATT.2023/01-01/04','Bộ','790.000','1','mới','21-11-2023','việt nam');
INSERT INTO home_device (userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Bộ thiết bị để vẽ trên bảng trong dạy học toán', 'NVH.TH.2023/01-01/04', 'Bộ', '117000', '4', 'mới', '21-11-2023', 'Việt Nam');
INSERT INTO home_device (userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Bộ thiết bị dạy học về các đường conic', 'NVH.TH.2023/02-01/04', 'Bộ', '585000', '4', 'mới', '21-11-2023', 'Việt Nam');
INSERT INTO home_device (userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Bộ thiết bị dạy học về thống kê và xác suất', 'NVH.TH.2023/03-01/08', 'Bộ', '58500', '8', 'mới', '21-11-2023', 'Việt Nam');
INSERT INTO home_device (userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Phim tư liệu: Một số hiện vật tiêu biểu của nền văn minh Sông Hồng và văn minh Đại Việt', 'NVH.LS.P.2023/01-01/03', 'Bộ', '315000', '3', 'mới', '21-11-2023', 'Việt Nam');
INSERT INTO home_device (userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Phim tư liệu: Thành tựu tiêu biểu của một số nền văn minh Phương Đông', 'NVH.LS.P.2023/02-01/03', 'Bộ', '315000', '3', 'mới', '21-11-2023', 'Việt Nam');
INSERT INTO home_device (userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Phim tư liệu: Thành tựu tiêu biểu của một số nền văn minh Phương Tây', 'NVH.LS.P.2023/03-01/03', 'Bộ', '243000', '3', 'mới', '21-11-2023', 'Việt Nam');
INSERT INTO home_device (userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Phim tư liệu: Thành tựu của cuộc cách mạng công nghiệp lần thứ nhất', 'NVH.LS.P.2023/04-01/03', 'Bộ', '243000', '3', 'mới', '21-11-2023', 'Việt Nam');
INSERT INTO home_device (userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Phim tư liệu: Thành tựu của cuộc cách mạng công nghiệp lần thứ hai', 'NVH.LS.P.2023/05-01/03', 'Bộ', '243000', '3', 'mới', '21-11-2023', 'Việt Nam');
INSERT INTO home_device (userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Phim tư liệu: Thành tựu của cuộc cách mạng công nghiệp lần thứ ba', 'NVH.LS.P.2023/06-01/03', 'Bộ', '243000', '3', 'mới', '21-11-2023', 'Việt Nam');
INSERT INTO home_device (userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Phim tư liệu: Thành tựu của cuộc cách mạng công nghiệp lần thứ tư', 'NVH.LS.P.2023/07-01/03', 'Bộ', '243000', '3', 'mới', '21-11-2023', 'Việt Nam');
INSERT INTO home_device (userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Phim tư liệu: Thành tựu của văn minh Đông Nam Á', 'NVH.LS.P.2023/08-01/03', 'Bộ', '202500', '3', 'mới', '21-11-2023', 'Việt Nam');
INSERT INTO home_device (userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Phim mô phỏng: Thành tựu của văn minh trên đất nước Việt Nam (trước năm 1958)', 'NVH.LS.P.2023/09-01/03', 'Bộ', '360000', '3', 'mới', '21-11-2023', 'Việt Nam');
INSERT INTO home_device (userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Phim tư liệu: Đời sống vật chất và tinh thần của cộng đồng các dân tộc việt Nam', 'NVH.LS.P.2023/10-01/03', 'Bộ', '202500', '3', 'mới', '21-11-2023', 'Việt Nam');
INSERT INTO home_device (userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Video/clip: Di sản Văn hóa ở Việt Nam', 'NVH.LS.Vid.2023/11-01/03', 'Bộ', '360000', '3', 'mới', '21-11-2023', 'Việt Nam');
INSERT INTO home_device (userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Lược đồ Di sản Văn hóa ở Việt Nam', 'NVH.LS.LĐ.2023/12-01/03', 'Tờ', '58500', '3', 'mới', '21-11-2023', 'Việt Nam');
INSERT INTO home_device (userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Video/clip về trái đất', 'NVH.ĐL10.Vid.2023/01-01/03', 'Bộ', '202500', '3', 'mới', '21-11-2023', 'Việt Nam');
INSERT INTO home_device (userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Video/clip về biến đổi khí hậu trên thế giới', 'NVH.ĐL10.Vid.2023/02-01/03', 'Bộ', '202500', '3', 'mới', '21-11-2023', 'Việt Nam');
INSERT INTO home_device (userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Quả địa cầu (hành chính)', 'NVH.ĐL10.ĐC.2023/03-01/03', 'Bộ', '225000', '3', 'mới', '21-11-2023', 'Việt Nam');
INSERT INTO home_device (userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Bản đồ nhiệt độ không khí trên trái đất', 'NVH.ĐL10.BĐ.2023/04-01/03', 'Tờ', '157500', '3', 'mới', '21-11-2023','Việt Nam');
INSERT INTO home_device (userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Bản đồ các đới và kiểu khí hậu trên trái đất', 'NVH.ĐL10.BĐ.2023/05-01/03', 'Tờ', '157500', '3', 'mới', '21-11-2023','Việt Nam');
INSERT INTO home_device (userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Bản đồ phân bố lượng mưa trung bình', 'NVH.ĐL10.BĐ.2023/06-01/03', 'Tờ', '157500', '3', 'mới', '21-11-2023','Việt Nam');
INSERT INTO home_device (userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Bản đồ các dòng biển trong đại dương trên thế giới', 'NVH.ĐL10.BĐ.2023/07-01/03', 'Tờ', '157500', '3', 'mới', '21-11-2023','Việt Nam');
INSERT INTO home_device (userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Bản đồ phân bố các nhóm đất và sinh vật trên trái đất', 'NVH.ĐL10.BĐ.2023/08-01/03', 'Tờ', '157500', '3', 'mới', '21-11-2023','Việt Nam');
INSERT INTO home_device (userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Bản đồ phân bố cây trồng và vật nuôi trên thế giới', 'NVH.ĐL10.BĐ.2023/09-01/03', 'Tờ', '157500', '3', 'mới', '21-11-2023','Việt Nam');
INSERT INTO home_device (userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Bản đồ phân bố một số ngành công nghiệp trên thế giới', 'NVH.ĐL10.BĐ.2023/10-01/03', 'Tờ', '157500', '3', 'mới', '21-11-2023','Việt Nam');
INSERT INTO home_device (userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Giá treo tranh', 'NVH.SUDDIA.GIATT.2023/01', 'Bộ', '790000', '1', 'mới', '21-11-2023','Việt Nam');
INSERT INTO home_device (userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Biến áp nguồn', 'NVH.VL.BA.2023/01-01/07', 'Cái', '1530000', '7', 'mới', '21-11-2023','Việt Nam');
INSERT INTO home_device (userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Bộ thiết bị đo kĩ thuật số tích hợp', 'NVH.VL.TBĐ.2023/02-01/01', 'Bộ', '21600000', '1', 'mới', '21-11-2023','Việt Nam');
INSERT INTO home_device (userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Hộp quả treo', 'NVH.VL.QT.2023/03-01/07', 'Hộp', '225000', '7', 'mới', '21-11-2023','Việt Nam');
INSERT INTO home_device (userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Lò xo', 'NVH.VL.LX.2023/04-01/07', 'Cái', '34200', '7', 'mới', '21-11-2023','Việt Nam');
INSERT INTO home_device (userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Thiết bị đo vận tốc và gia tốc của vật rơi tự do', 'NVH.VL.TBĐ.2023/05-01/01', 'Bộ', '3150000', '1', 'mới', '21-11-2023','Việt Nam');
INSERT INTO home_device (userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Thiết bị tổng hợp hai lực đồng quy và song song', 'NVH.VL.TBTH.2023/06-01/01', 'Bộ', '1719000', '1', 'mới', '21-11-2023','Việt Nam');
INSERT INTO home_device (userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Video biến dạng và đặc tính của lò xo', 'NVH.VL.Vid.2023/07-01/01', 'Bộ', '202500', '1', 'mới', '21-11-2023','Việt Nam');
INSERT INTO home_device (userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Phần mềm mô phỏng 3D bản đồ sao', 'NVH.VL.PM.2023/08-01/01', 'Bộ', '990000', '1', 'mới', '21-11-2023','Việt Nam');
INSERT INTO home_device (userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Phần mềm 3D mô phỏng trái đất, mặt trời, mặt trăng', 'NVH.VL.PM.2023/09-01/01', 'Bộ', '990000', '1', 'mới', '21-11-2023','Việt Nam');
INSERT INTO home_device (userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Phần mềm 3D mô phỏng nhật, nguyệt thực, thủy triều', 'NVH.VL.PM.2023/10-01/01', 'Bộ', '990000', '1', 'mới', '21-11-2023','Việt Nam');
INSERT INTO home_device (userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Dây nối', 'NVH.VL.DN.2023/10-01/07', 'Bộ', '315000', '7', 'mới', '21-11-2023','Việt Nam');
INSERT INTO home_device (userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Giá thí nghiệm', 'NVH.VL.GI.2023/11-01/07', 'Bộ', '315000', '7', 'mới', '21-11-2023','Việt Nam');
INSERT INTO home_device (userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Bộ bàn ghế của GV', 'VL.BGGV.2023/02', 'Bộ', '3800000', '2', 'mới', '21-11-2023','Việt Nam');
INSERT INTO home_device (userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Bộ bàn ghế thực hành của học sinh', 'VL.BGHS.2023/14', 'Bộ', '5000000', '14', 'mới', '21-11-2023','Việt Nam');
INSERT INTO home_device (userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Giá thiết bị', 'VL.BGHS.2023/14', 'Bộ', '4360000', '6', 'mới', '21-11-2023','Việt Nam');
INSERT INTO home_device (userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Xe đẩy vận chuyển thiết bị', 'VL.XEDAY.2023/06', 'Bộ', '1920000', '6', 'mới', '21-11-2023','Việt Nam');
INSERT INTO home_device (userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Giá treo tranh', 'VL.GIATT.2023/07', 'Bộ', '790000', '7', 'mới', '21-11-2023','Việt Nam');
INSERT INTO home_device (userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Bộ đồ mổ', 'NVH.SH.BĐM.2023/01-01/07', 'Bộ', '378000', '7', 'mới', '21-11-2023','Việt Nam');
INSERT INTO home_device (userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Bộ thí nghiệm xác định thành phần của tế bào', 'NVH.SH.BTN.2023/02-01/04', 'Bộ', '349650', '4', 'mới', '21-11-2023','Việt Nam');
INSERT INTO home_device (userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Bộ hóa chất xác định thành phần của tế bào', 'NVH.SH.BHC.2023/03-01/01', 'Bộ', '349650', '1', 'mới', '21-11-2023','Việt Nam');
INSERT INTO home_device (userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Bộ hóa chất làm tiêu bản, quan sát cấu trúc tế bào', 'NVH.SH.BHC.2023/04-01/01', 'Bộ', '871200', '1', 'mới', '21-11-2023','Việt Nam');
INSERT INTO home_device (userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Bộ hóa chất xác định ảnh hưởng của các yếu tố đến hoạt tính của enzyme', 'NVH.SH.BHC.2023/05-01/01', 'Bộ', '450000', '1', 'mới', '21-11-2023','Việt Nam');
INSERT INTO home_device (userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Bộ hóa chất làm tiêu bản NST, quan sát nguyên nhân, giảm phân', 'NVH.SH.BHC.2023/06-01/01', 'Bộ', '930600', '1', 'mới', '21-11-2023','Việt Nam');
INSERT INTO home_device (userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Bộ hóa chất thực hành phương pháp nghiên cứu vi sinh vật', 'NVH.SH.BHC.2023/07-01/01', 'Bộ', '188100', '1', 'mới', '21-11-2023','Việt Nam');
INSERT INTO home_device (userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Ống nghiệm', 'NVH.SH.ON.2023/08-01/50', 'Ống', '4500', '50', 'mới', '21-11-2023','Việt Nam');
INSERT INTO home_device (userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Giá để ống nghiệm', 'NVH.SH.GI.2023/09-01/10', 'Cái', '43200', '10', 'mới', '21-11-2023','Việt Nam');
INSERT INTO home_device (userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Đèn cồn', 'NVH.SH.ĐC.2023/10-01/07', 'Cái', '45000', '7', 'mới', '21-11-2023','Việt Nam');
INSERT INTO home_device (userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Cốc thủy tinh loại 250', 'NVH.SH.CTT.2023/11-01/07', 'Cái', '39600', '7', 'mới', '21-11-2023','Việt Nam');
INSERT INTO home_device (userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Chổi rửa ống nghiệm', 'NVH.SH.CH.2023/12-01/07', 'Cái', '21600', '7', 'mới', '21-11-2023','Việt Nam');
INSERT INTO home_device (userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Kính hiển vi', 'NVH.SH.KHV.2023/13-01/01', 'Cái', '3960000', '1', 'mới', '21-11-2023','Việt Nam');
INSERT INTO home_device (userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Dao cắt tiêu bản', 'NVH.SH.DCTB.2023/14-01/07', 'Cái', '54000', '7', 'mới', '21-11-2023','Việt Nam');
INSERT INTO home_device (userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Lam kính', 'NVH.SH.LK.2023/15-01/07', 'Hộp', '36000', '7', 'mới', '21-11-2023','Việt Nam');
INSERT INTO home_device (userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Lamen', 'NVH.SH.LM.2023/16-01/07', 'Hộp', '36000', '7', 'mới', '21-11-2023','Việt Nam');
INSERT INTO home_device (userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Kim mũi mác', 'NVH.SH.KMM.2023/17-01/07', 'Cái', '27000', '7', 'mới', '21-11-2023','Việt Nam');
INSERT INTO home_device (userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Cối, chày sứ', 'NVH.SH.COICHAY.2023/18-01/07', 'Cái', '54000', '7', 'mới', '21-11-2023','Việt Nam');
INSERT INTO home_device (userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Đĩa Petri', 'NVH.SH.PETRI.2023/19-01/07', 'Cái', '15120', '7', 'mới', '21-11-2023','Việt Nam');
INSERT INTO home_device (userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Panh kẹp', 'NVH.SH.PANH.2023/20-01/07', 'Cái', '19800', '7', 'mới', '21-11-2023','Việt Nam');
INSERT INTO home_device (userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Pipet', 'NVH.SH.PIPET.2023/21-01/07', 'Cái', '28350', '7', 'mới', '21-11-2023','Việt Nam');
INSERT INTO home_device (userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Đũa thủy tinh', 'NVH.SH.ĐTT.2023/22-01/07', 'Cái', '12600', '7', 'mới', '21-11-2023','Việt Nam');
INSERT INTO home_device (userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Giất thấm', 'NVH.SH.GIAYTHAM.2023/23-01/07', 'Cái', '81000', '7', 'mới', '21-11-2023','Việt Nam');
INSERT INTO home_device (userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Pipet nhựa', 'NVH.SH.GIAYTHAM.2023/24-01/07', 'Cái', '5670', '7', 'mới', '21-11-2023','Việt Nam');
INSERT INTO home_device (userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Đĩa đồng hồ', 'NVH.SH.ĐĐH.2023/25-01/07', 'Cái', '18000', '7', 'mới', '21-11-2023','Việt Nam');
INSERT INTO home_device (userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Kẹp ống nghiệm', 'NVH.SH.KEPON.2023/26-01/07', 'Cái', '14400', '7', 'mới', '21-11-2023','Việt Nam');
INSERT INTO home_device (userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Lọ kèm ống nhỏ giọt', 'NVH.SH.LNG.2023/27-01/07', 'Cái', '28800', '7', 'mới', '21-11-2023','Việt Nam');
INSERT INTO home_device (userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Lọ có nút nhám', 'NVH.SH.LNN.2023/28-01/07', 'Cái', '27000', '7', 'mới', '21-11-2023','Việt Nam');
INSERT INTO home_device (userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Bộ thu nhận số liệu', 'NVH.SH.BTNSL.2023/29-01/01', 'Bộ', '18000000', '1', 'mới', '21-11-2023','Việt Nam');
INSERT INTO home_device (userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Cảm biến độ PH', 'NVH.SH.CBPH.2023/30-01/01', 'Chiếc', '3510000', '1', 'mới', '21-11-2023','Việt Nam');
INSERT INTO home_device (userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Bộ bàn ghế của giáo viên', 'NVH.SH.BGGV/2023/01/02', 'Bộ', '3800000', '2', 'mới', '21-11-2023','Việt Nam');
INSERT INTO home_device (userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Bộ bàn ghế thực hành của học sinh', 'NVH.SH.BGHS/2023/01/14', 'Bộ', '5000000', '14', 'mới', '21-11-2023','Việt Nam');
INSERT INTO home_device (userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Giá để thiết bị', 'NVH.SH.GTB/2023/01/08', 'Chiếc', '4360000', '8', 'mới', '21-11-2023','Việt Nam');
INSERT INTO home_device (userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Tủ đựng hóa chất', 'NVH.SH.THC/2023/01/04', 'Chiếc', '9500000', '4', 'mới', '21-11-2023','Việt Nam');
INSERT INTO home_device (userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Xe đẩy vận chuyển thiết bị', 'NVH.SH.XEDAY/2023/01/04', 'Chiếc', '1920000', '4', 'mới', '21-11-2023','Việt Nam');
INSERT INTO home_device (userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Giá treo tranh', 'NVH.SH.GTT/2023/16', 'Chiếc', '790000', '16', 'mới', '21-11-2023','Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Máy cất nước 1 lần', 'NVH.HH.MCN/2023.01/01', 'Cái', '#', '1', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Tủ hút', 'NVH.HH.TUHUT/2023.02/01', 'Cái', '#', '1', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Tủ đựng hóa chất', 'NVH.HH.TUHOACHAT/2023.03/01', 'Cái', '#', '1', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Bôt sắt Fe, loại mịn có màu trắng xám (Fe)', 'NVH.HH/2023.04/100', 'g', '360', '100', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Băng magnesium (Mg)', 'NVH.HH/2023.05/100', 'g', '1.386', '100', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Nhôm lá (Al)', 'NVH.HH/2023.06/100', 'g', '810', '100', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Nhôm bột, loại mịn màu trắng bạc (Al)', 'NVH.HH/2023.07/100', 'g', '396', '100', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Đồng vụn (Cu)', 'NVH.HH/2023.08/100', 'g', '990', '100', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Đồng lá (Cu)', 'NVH.HH/2023.09/100', 'g', '990', '100', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Kẽm viên(Zn)', 'NVH.HH/2023.10/100', 'g', '792', '100', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Sodium(Na)', 'NVH.HH/2023.11/100', 'g', '3960', '100', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Lưu huỳnh bột (S)', 'NVH.HH/2023.12/100', 'g', '360', '100', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Bromine lỏng(Br)', 'NVH.HH/2023.13/100', 'ml', '990', '100', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Iodine(I)', 'NVH.HH/2023.14/100', 'g', '4500', '100', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Sodium hydroxide (NaOH)', 'NVH.HH/2023.15/500', 'g', '180', '500', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Hydrochloric acid 37% (Hcl)', 'NVH.HH/2023.16/500', 'ml', '180', '500', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Sulfuric acid 98% (H2SO4)', 'NVH.HH/2023.17/500', 'ml', '180', '500', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Nitric acid 65% (HNO3)', 'NVH.HH/2023.18/100', 'ml', '450', '100', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Potassium iodide (KI)', 'NVH.HH/2023.19/100', 'g', '4320', '100', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Sodium fluoride (NaF)', 'NVH.HH/2023.20/100', 'g', '540', '100', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Sodium chloride (NaCl)', 'NVH.HH/2023.21/100', 'g', '270', '100', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Sodium bromide (NaBr)', 'NVH.HH/2023.22/100', 'g', '693', '100', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Sodium iodide (NaI)', 'NVH.HH/2023.23/100', 'g', '5544', '100', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Calcium chloride(CaCl2.6H2O)', 'NVH.HH/2023.24/100', 'g', '297', '100', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Iron (III) chloride (FeCl3)', 'NVH.HH/2023.25/100', 'g', '360', '100', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Iron sulfate heptahydrate, (FeSO4.7H2O)', 'NVH.HH/2023.26/100', 'g', '360', '100', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Potassium nitrate (KNO3)', 'NVH.HH/2023.27/100', 'g', '792', '100', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Silver nitrate, (AgNO3)', 'NVH.HH/2023.28/30', 'g', '46.8', '30', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Copper (II) sulfate, (CuSO4.5H2O)', 'NVH.HH/2023.29/500', 'g', '396', '500', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Zinc sulfate (ZnSO4.7H2O)', 'NVH.HH/2023.30/100', 'g', '360', '100', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Calcium carbonate (CaCO3)', 'NVH.HH/2023.31/100', 'g', '297', '100', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Sodium carbonate, (Na2CO3.10H2O)', 'NVH.HH/2023.32/100', 'g', '359', '100', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Sodium hydrogen carbonate (NaHCO3)', 'NVH.HH/2023.33/100', 'g', '395', '100', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Dung dịch ammonia bão hòa (NH3)', 'NVH.HH/2023.34/100', 'ml', '297', '100', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Potassium permanganate, (KMnO4)', 'NVH.HH/2023.35/100', 'g', '477', '100', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Potassium chlorate (KClO3)', 'NVH.HH/2023.36/100', 'g', '396', '100', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Sodium thiosulfate, (Na2S2O3)', 'NVH.HH/2023.37/100', 'g', '297', '100', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Hydrogen peroxide 30% (H2O2)', 'NVH.HH/2023.38/100', 'ml', '297', '100', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Phenolphthalein', 'NVH.HH/2023.39/10', 'g', '9900', '10', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Glucose (C6H12O6)', 'NVH.HH/2023.40/500', 'g', '238', '100', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Ethanol 96 (C2H5OH)', 'NVH.HH/2023.41/1000', 'ml', '90', '1000', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Than gỗ', 'NVH.HH/2023.42/200', 'g', '198', '200', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Cồn đốt', 'NVH.HH/2023.43/2000', 'ml', '90', '2000', 'mới', '2023-11-21', 'Việt Nam');

-- ok

INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Sodium acetate (CH3COONa)', 'NVH.HH/2023.44/100', 'g', '396', '100', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Ammonium sulfate ((NH4)2SO4)', 'NVH.HH/2023.45/100', 'g', '270', '100', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Hexane (C6H14)', 'NVH.HH/2023.46/500', 'ml', '630', '500', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Calcium carbide (CaC2)', 'NVH.HH/2023.47/300', 'g', '180', '300', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Benzene (C6H6)', 'NVH.HH/2023.48/200', 'ml', '360', '200', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Toluene (C7H8)', 'NVH.HH/2023.49/100', 'ml', '810', '100', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Glycerol (C3H8O3)', 'NVH.HH/2023.50/300', 'ml', '270', '300', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Phenol (C6H5OH)', 'NVH.HH/2023.51/100', 'g', '810', '100', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Ethanal (C2H4O)', 'NVH.HH/2023.52/300', 'ml', '2430', '300', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Acetic acid (CH3COOH)', 'NVH.HH/2023.53/300', 'ml', '180', '300', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Saccharose (C12H22O11)', 'NVH.HH/2023.54/300', 'g', '90', '300', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Tinh bột (starch), (C6H10O5)n', 'NVH.HH/2023.55/300', 'g', '900', '300', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Ethylamine (C2H5NH2)', 'NVH.HH/2023.56/100', 'ml', '1188', '100', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Aniline (C5H5NH2)', 'NVH.HH/2023.57/100', 'ml', '990', '100', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Barium chloride (BaCl2)', 'NVH.HH/2023.58/100', 'g', '360', '100', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Aluminium potassium sulfate Dodecahydrate (KAl(SO4)2.12H2O)', 'NVH.HH/2023.59/100', 'g', '279', '100', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Cân điện tử', 'NVH.HH.CAN.2023/01-01/02', 'Cái', '450000', '2', 'mới', '2023-11-21', 'Trung Quốc');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Ống đong hình trụ 100ml', 'NVH.HH.OĐ.2023/02-01/07', 'Cái', '39600', '7', 'mới', '2023-11-21', 'Trung Quốc');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Bình tam giác 100ml', 'NVH.HH.BTG.2023/03-01/07', 'Cái', '32400', '7', 'mới', '2023-11-21', 'Trung Quốc');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Cốc thủy tinh 250ml', 'NVH.HH.COC250.2023/04-01/07', 'Cái', '39600', '7', 'mới', '2023-11-21', 'Trung Quốc');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Cốc thủy tinh 100ml', 'NVH.HH.COC100.2023/05-01/07', 'Cái', '31500', '7', 'mới', '2023-11-21', 'Trung Quốc');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Cốc đốt', 'NVH.HH.COC500.2023/06-01/07', 'Cái', '54000', '7', 'mới', '2023-11-21', 'Trung Quốc');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Ống nghiệm', 'NVH.HH.ON.2023/07-01/50', 'Cái', '4500', '50', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Ống nghiệm có nhánh', 'NVH.HH.ONCN.2023/08-01/20', 'Cái', '10800', '20', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Ống hút nhỏ giọt', 'NVH.HH.OHNG.2023/09-01/20', 'Cái', '9000', '20', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Ống dẫn thủy tinh các loại', 'NVH.HH.ODTT.2023/10-01/10', 'Bộ', '36000', '10', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Bình cầu có nhánh', 'NVH.HH.BC250CN.2023/11-01/07', 'Cái', '72000', '7', 'mới', '2023-11-21', 'Trung Quốc');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Đũa thủy tinh', 'NVH.HH.ĐTT.2023/12-01/07', 'Cái', '12600', '7', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Thìa xúc hóa chất', 'NVH.HH.THC.2023/13-01/07', 'Cái', 14400, 7, 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Đèn cồn', 'NVH.HH.ĐC.2023/14-01/07', 'Cái', '45000', '7', 'mới', '2023-11-21', 'Trung Quốc');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Bộ dụng cụ thí nghiệm phân tích thể thích', 'NVH.HH.HPTTT.2023/15-01/07', 'Bộ', '1170000', '7', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Kiềng 3 chân', 'NVH.HH.KIENG/2023.75/07', 'Cái', '56700', '7', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Lướt tản nhiệt', 'NVH.HH.LTN/2023.76/07', 'Cái', '22500', '7', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Nút cao su không có lỗ các loại', 'NVH.HH.NUTCS/2023.77/07', 'Bộ', '55800', '7', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Nút cao su có lỗ các loại', 'NVH.HH.NUTKL/2023.78/07', 'Bộ', '63000', '7', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Ống dẫn', 'NVH.HH.OD/2023.79/05', 'ml', '28350', '5', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Muỗng đốt hóa chất', 'NVH.HH.MĐ/2023.80/07', 'Cái', '22680', '7', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Kẹp ống nghiệm', 'NVH.HH.KEPON/2023.81/14', 'Cái', '14400', '14', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Chổi rửa ống nghiệm', 'NVH.HH.CHOI/2023.82/14', 'Cái', '21600', '14', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Panh gắp hóa chất', 'NVH.HH.PANH/2023.83/07', 'Cái', '19800', '7', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Bình xịt tia nước', 'NVH.HH.BXTN/2023.84/07', 'Cái', '32400', '7', 'mới', '2023-11-21', 'Trung Quốc');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Giá để ống nghiệm', 'NVH.HH.GIAON/2023.85/06', 'Cái', '43200', '6', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Khay mang dụng cụ và hóa chất', 'NVH.HH.KHAYHC.2023/86-01/02', 'Cái', '234000', '2', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Khay đựng dụng cụ, hóa chất', 'NVH.HH.KHAY.2023/87-01/07', 'Cái', '144000', '7', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Nhiệt kế rượu màu', 'NVH.HH.NK/2023.88/07', 'Cái', '27000', '7', 'mới', '2023-11-21', 'Trung Quốc');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Giấy lọc', 'NVH.HH.NK/2023.89/02', 'Hộp', '81000', '2', 'mới', '2023-11-21', 'Trung Quốc');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Giấy quỳ tím', 'NVH.HH.QUYTIM/2023.90/02', 'Hộp', '45000', '2', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Giấy pH', 'NVH.HH.GIAYPH/2023.91/02', 'Tệp', '18900', '2', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Áo khoác phòng thí nghiệm', 'NVH.HH.NK/2023.92/45', 'Cái', '160650', '45', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Kính bảo vệ mắt không màu', 'NVH.HH.NK/2023.93/10', 'Cái', '36000', '10', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Khẩu trang y tế', 'NVH.HH.NK/2023.94/03', 'Hộp', '63000', '3', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Găng tay cao su', 'NVH.HH.NK/2023.95/01', 'Hộp', '594000', '1', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Cầu môn, lưới bóng đá', 'TD10.2023/01-01/01', 'Bộ', '13860000', '1', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Cột lưới, cầu lông', 'TD10.2023/02-01/01', 'Bộ', '1710000', '1', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Thước dây', 'TD10.2023/03-01/03', 'Chiếc', '90000', '3', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Cờ lệnh thể thao', 'TD10.2023/04-01/12', 'Chiếc', '36000', '12', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Biển lật số', 'TD10.2023/05-01/02', 'Chiếc', '495000', '2', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Nấm thể thao', 'TD10.2023/06-01/60', 'Chiếc', '17100', '60', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Bơm', 'TD10.2023/07-01/01', 'Chiếc', '405000', '1', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Quả bóng đá', 'TD10.2023/08-01/20', 'Chiếc', '207000', '20', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Quả bóng chuyền', 'TD10.2023/09-01/20', 'Chiếc', '117000', '20', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Bộ tranh dùng cho lớp 10', 'QPAN10.TRANH.2023.01-01/02', 'Bộ', '312000', '2', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Bộ tranh dùng cho lớp 11', 'QPAN11.TRANH.2023.02-01/02', 'Bộ', '880000', '2', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Bộ tranh dùng cho lớp 12', 'QPAN12.TRANH.2023.03-01/02', 'Bộ', '350000', '2', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Mô hình súng AK-47 cắt bổ', 'QPAN.SUNGAK-47.2023.04-01/01', 'Khẩu', '4750000', '1', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Mô hình súng CKC cắt bổ', 'QPAN.SUNGCKC.2023.05-01/01', 'Khẩu', '4750000', '1', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Mô hình súng B40 cắt bổ', 'QPAN.SUNGB40.2023.06-01/01', 'Khẩu', '3450000', '1', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Mô hình súng B41 cắt bổ', 'QPAN.SUNGB41-47.2023.07-01/01', 'Khẩu', '4150000', '1', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Bao đạn, túi đựng lựu đạn', 'QPAN.BAOTUIDAN.2023.08-01/20', 'Chiếc', '305000', '20', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Bộ bia (Khung + mặt bia số 4)', 'QPAN.BIA.2023.09-01/10', 'Bộ', '580000', '10', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Kính kiểm tra ngắm', 'QPAN.KINHNGAM.2023.10-01/04', 'Chiếc', '105000', '4', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Đồng tiền di động', 'QPAN.ĐTDĐ.2023.11-01/02', 'Chiếc', '23000', '2', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Dụng cụ băng bó cứu thương', 'QPAN.DCCT.2023.12-01/10', 'Bộ', '880000', '10', 'mới', '2023-11-21', 'Việt Nam');
INSERT INTO home_device(userId_id, name, code, unit, price, quantity, status, date, location)
VALUES (1, 'Tủ đựng súng và đựng thiết bị', 'QPAN.TUDUNGSUNG.2023.13-01/01', 'Bộ', '8000000', '1', 'mới', '2023-11-21', 'Việt Nam');