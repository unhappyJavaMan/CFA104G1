package com.roomServiceOrderList.model;

import java.util.List;


public interface RoomServiceOrderList_interface {
	public void insert(RoomServiceOrderListVO roomServicelRoomServiceOrderListVO);
    public void update(RoomServiceOrderListVO roomServicelRoomServiceOrderListVO);
      public void delete(Integer service_order_id);
    public RoomServiceOrderListVO findByPrimaryKey(Integer service_order_id);
    public List<RoomServiceOrderListVO> getAll();
  //�P�ɷs�W�����P���u (��ȤW�ä��`��, ��,�i�Φb�q��D�ɻP�����ɤ@���s�W���\)
    public void insert2 (RoomServiceOrderListVO rsolVO , java.sql.Connection con);
	public List<RoomServiceOrderListVO> getAllListByPK(Integer service_order_id);
}
