package com.eshop.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.eshop.bean.Merchantable;
import com.eshop.bean.Types;
import com.eshop.service.HeadService;
import com.eshop.tool.SubString;
import com.opensymphony.xwork2.ActionSupport;

public class TypesAction extends ActionSupport implements SessionAware
{
	private HeadService headService;
	private List<Merchantable> merchantables;
	private List<Merchantable> merchantables2;
	private List recommends;
	private Map session;
	private List<Types> types;
	private String id;
	private String typeName;
	private String typeDesc;

	public List getRecommends()
	{
		return recommends;
	}

	public void setRecommends(List recommends)
	{
		this.recommends = recommends;
	}

	public List<Merchantable> getMerchantables2()
	{
		return merchantables2;
	}

	public void setMerchantables2(List<Merchantable> merchantables2)
	{
		this.merchantables2 = merchantables2;
	}

	public String getTypeName()
	{
		return typeName;
	}

	public void setTypeName(String typeName)
	{
		this.typeName = typeName;
	}

	public String getTypeDesc()
	{
		return typeDesc;
	}

	public void setTypeDesc(String typeDesc)
	{
		this.typeDesc = typeDesc;
	}

	public String getId()
	{
		return id;
	}

	public void setId(String id)
	{
		this.id = id;
	}

	public List<Types> getTypes()
	{
		return types;
	}

	public void setTypes(List<Types> types)
	{
		this.types = types;
	}

	public List<Merchantable> getMerchantables()
	{
		return merchantables;
	}

	public void setMerchantables(List<Merchantable> merchantables)
	{
		this.merchantables = merchantables;
	}

	public HeadService getHeadService()
	{
		return headService;
	}

	public void setHeadService(HeadService headService)
	{
		this.headService = headService;
	}

	public void setSession(Map<String, Object> session)
	{
		this.session = session;
	}

	/**
	 * ��ʾ��ҳ��
	 */
	@Override
	public String execute()
	{
		session.put("types", headService.findAllTypes());
		this.setMerchantables(headService.findAllMerchantable());
		for (Merchantable m : merchantables)
		{
			// �жϳ���
			m.setSubMerName(new SubString().getMerchandise(m.getMerName())
					.trim());
		}

		this.setMerchantables(merchantables);
		// �������а�
		List<Merchantable> mers = headService.findMerByNum();
		this.setMerchantables2(mers);
		// �Ƽ���Ʒ
		this.setRecommends(headService.findByReCommend());
		return SUCCESS;
	}

	// ע��
	public String exit()
	{
		session.clear();
		return "exit";
	}

	/**
	 * ��ȡ��Ʒ����
	 * 
	 * @return
	 */
	public String getAllType()
	{
		this.setTypes(headService.findAllTypes());
		return "go";
	}

	/**
	 * ɾ������
	 */
	public String deleteType()
	{
		headService.deleteType(id);
		getAllType();
		return "delete";
	}

	/**
	 * �������
	 */
	public String addType()
	{
		Types type = new Types();
		type.setTypeName(typeName);
		type.setTypeDesc(typeDesc);
		headService.saveType(type);
		getAllType();
		this.addActionError("��ӳɹ�");
		return "add";
	}

	/**
	 * �޸�����
	 */
	public String updateType()
	{
		headService.updateType(id, typeName, typeDesc);
		getAllType();
		this.addActionError("�޸ĳɹ�");
		return "update";
	}

	/**
	 * �Ƽ����ൽ��ҳ
	 */
	public String recommend()
	{
		headService.updateType(id, 1);
		this.addActionError("�Ƽ��ɹ�");
		getAllType();
		return "update";
	}

	/**
	 * ȡ���Ƽ�
	 */
	public String cancelRecommend()
	{
		headService.updateType(id, 0);
		this.addActionError("ȡ���Ƽ��ɹ�");
		getAllType();
		return "update";
	}
}
