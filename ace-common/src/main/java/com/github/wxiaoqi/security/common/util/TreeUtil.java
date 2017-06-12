package com.github.wxiaoqi.security.common.util;

import com.github.wxiaoqi.security.common.vo.TreeNode;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Ace on 2017/6/12.
 */
public class TreeUtil {
    public static int ROOT = -1;
  /**
   * 两层循环实现建树
   * 
   * @param treeNodes 传入的树节点列表
   * @return
   */
  public static List<TreeNode> bulid(List<TreeNode> treeNodes) {

    List<TreeNode> trees = new ArrayList<TreeNode>();

    for (TreeNode treeNode : treeNodes) {

      if (ROOT == treeNode.getParentId()) {
        trees.add(treeNode);
      }

      for (TreeNode it : treeNodes) {
        if (it.getParentId() == treeNode.getId()) {
          if (treeNode.getChildren() == null) {
            treeNode.setChildren(new ArrayList<TreeNode>());
          }
          treeNode.getChildren().add(it);
        }
      }
    }
    return trees;
  }

  /**
   * 使用递归方法建树
   * 
   * @param treeNodes
   * @return
   */
  public static List<TreeNode> buildByRecursive(List<TreeNode> treeNodes) {
    List<TreeNode> trees = new ArrayList<TreeNode>();
    for (TreeNode treeNode : treeNodes) {
      if (ROOT == treeNode.getParentId()) {
        trees.add(findChildren(treeNode, treeNodes));
      }
    }
    return trees;
  }

  /**
   * 递归查找子节点
   * 
   * @param treeNodes
   * @return
   */
  public static TreeNode findChildren(TreeNode treeNode, List<TreeNode> treeNodes) {
    for (TreeNode it : treeNodes) {
      if (treeNode.getId() == it.getParentId()) {
        if (treeNode.getChildren() == null) {
          treeNode.setChildren(new ArrayList<TreeNode>());
        }
        treeNode.getChildren().add(findChildren(it, treeNodes));
      }
    }
    return treeNode;
  }
}
